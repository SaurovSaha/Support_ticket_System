<?php

namespace App\Models;
use App\Models\User;
use App\Models\OpenTicket;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketConversation extends Model
{
    protected $fillable = [
        'ticket_id',
        'user_id',
        'issues_details',
        'attachment',
        'status',
    ];

    public function user()
    {
        return $this->belongsTo(user::class);
    }
    public function ticket()
    {
        return $this->belongsTo(OpenTicket::class, 'ticket_id');
    }
}
