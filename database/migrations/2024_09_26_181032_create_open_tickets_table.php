<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('open_tickets', function (Blueprint $table) {
            $table->id();
            $table->string('title_name');
            $table->string('issues_details', 4000);
            $table->text('attachment');
            $table->unsignedBigInteger('user_id');
            $table->enum('status', ['Active', 'Closed'])->default('Active');
            $table->foreign('user_id')->references('id')->on('users')->cascadeOnDelete();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('open_tickets');
    }
};
