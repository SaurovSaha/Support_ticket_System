<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\TicketConversation;

class OpenTicket extends Model
{
    protected $fillable = [
        'title_name',
        'issues_details',
        'attachment',
        'user_id',
        'status',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function conversations()
    {
        return $this->hasMany(TicketConversation::class, 'ticket_id');
    }
}
