<?php

namespace App\Http\Controllers;

use App\Models\OpenTicket;
use App\Models\TicketConversation;
use App\Notifications\TicketClosedNotification;
use App\Models\User;
use Illuminate\Http\Request;

class TicketConversationController extends Controller
{
    public function index(){

    }

    public function store(Request $request) {
        $user_id = Auth()->id();
        $request->validate([
            'ticket_id'        => 'required|exists:open_tickets,id',
            'issues_details'   => 'required|string',
            'attachment.*'     => 'nullable|file|mimes:jpeg,png,jpg,pdf,gif,svg|max:100000',
            'status'           => 'nullable|in:Active,Closed'
        ]);
    
        $attachment = [];
        if ($request->hasFile('attachment')) {
            foreach ($request->file('attachment') as $file) {
                $filename = time() . '_' . $file->getClientOriginalName();
                $destinationPath = public_path('upload/customer/Opent_ticket');
                $file->move($destinationPath, $filename);
                $attachment[] = 'upload/customer/Opent_ticket/' . $filename;
            }
        }
    
        // Create a new conversation
        TicketConversation::create([
            'ticket_id'      => $request->input('ticket_id'),
            'issues_details' => $request->input('issues_details'),
            'attachment'     => !empty($attachment) ? json_encode($attachment) : null,
            'status'         => $request->input('status'),
            'user_id'        => $user_id,
        ]);
    
        if ($request->input('status') === 'Closed') {
            $openTicket = OpenTicket::find($request->input('ticket_id'));
            if ($openTicket) {
                $openTicket->status = 'Closed';
                $openTicket->save(); 
                $customer = User::find($openTicket->user_id);
                $customer->notify(new TicketClosedNotification($openTicket));
            }
        }

        return redirect()->route('tickets.show', $request->input('ticket_id'))->with('success', 'Message sent successfully!');
    }
    

    public function show($id)
    {
        $ticket = OpenTicket::with(['conversations.user', 'user'])->findOrFail($id);
        return view('tickets.show', compact('ticket'));
    }
    
}
