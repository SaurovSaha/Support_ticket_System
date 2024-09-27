<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\OpenTicket;
use Illuminate\Support\Facades\Auth;
use App\Notifications\NewTicketNotification;
use Exception;
use Carbon\Carbon;

class OpenTicketController extends Controller
{

    public function Ticketindex()
    {
        $user = Auth::user();
        if ($user->usertype === 'admin') {
            // Admin sees all tickets
            $tickets = OpenTicket::all();
        } else {
            $tickets = OpenTicket::where('user_id', $user->id)->get();
        }

        return view('ticket-index', compact('tickets'));
    }
    public function index()
    {
        if(Auth::id())
        {
            $usertype = Auth()->user()->usertype;
            if($usertype == 'customer')
            {
                return view('customer.openticket');
            }
        }
    }

    public function store(Request $request)
    {
        // return response()->json($request->all());
            $user_id = Auth()->id();
            $request->validate([
                'title_name'        => 'required|string',
                'issues_details'    => 'required|string',
                'attachment.*'      => 'nullable|file|mimes:jpeg,png,jpg,gif,svg|max:100000',
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

            $ticket = OpenTicket::create([
                        'title_name'        => $request->input('title_name'),
                        'issues_details'    => $request->input('issues_details'),
                        'attachment'        => !empty($attachment) ? json_encode($attachment) : null,
                        'status'            => 'Active',
                        'user_id'           => $user_id,
                    ]);

            $admins = User::where('usertype', 'admin')->get();
            foreach ($admins as $admin) {
                $admin->notify(new NewTicketNotification($ticket));
            }

            return redirect()->route('open.ticket')->with('success', 'Ticket submitted successfully!');
    }

    public function TicketShow(string $id) {
        try {
            $ticket = OpenTicket::findOrFail($id);
            $user = Auth::user(); 
            $ticket->attachment = json_decode($ticket->attachment, true); 
    
            return view('ticket-conversation')
                ->with('ticket', $ticket)
                ->with('user', $user)
                ->with('success', 'Ticket retrieved successfully!');
        } catch (\Exception $e) {
            return response()->json(['status' => 'fail', 'message' => $e->getMessage()]);
        }
    }
    
}
