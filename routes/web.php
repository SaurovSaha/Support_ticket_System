<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OpenTicketController;
use App\Http\Controllers\TicketConversationController;
use App\Notifications\NewTicketNotification;
use App\Models\User; // Adjust according to your User model
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

route::get('/home', [HomeController::class, 'index'])->middleware(['auth', 'verified'])->name('home');

route::get('/open-ticket', [OpenTicketController::class, 'index'])->middleware(['auth', 'verified'])->name('open.ticket');
route::post('/ticket-store', [OpenTicketController::class, 'store'])->middleware(['auth', 'verified'])->name('tickets.store');

Route::get('/tickets', [OpenTicketController::class, 'Ticketindex'])->middleware(['auth', 'verified'])->name('tickets.index');
Route::get('/tickets-show/{id}', [OpenTicketController::class, 'TicketShow'])->middleware(['auth', 'verified'])->name('tickets.show');

route::post('/conversation/store/{ticket}', [TicketConversationController::class, 'store'])->middleware(['auth', 'verified'])->name('conversation.store');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
