<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-2xl text-gray-900 leading-tight">
            {{ __('Ticket Conversation') }}
        </h2>
    </x-slot>

    <div class="py-12 bg-gray-50">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white shadow-lg rounded-lg">
                <div class="p-6 text-gray-900 space-y-6">

                    <!-- Display Errors and Success Messages -->
                    @if ($errors->any())
                        <div class="p-4 bg-red-100 border-l-4 border-red-500 text-red-700 mb-6 rounded-md">
                            <ul class="list-disc list-inside text-sm">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    @if(session('success'))
                        <div class="p-4 bg-green-100 border-l-4 border-green-500 text-green-700 rounded-md">
                            {{ session('success') }}
                        </div>
                    @endif

                    <!-- Ticket Title -->
                    <div class="flex items-center justify-between mb-4">
                        <div>
                            <h4 class="text-xl font-semibold text-indigo-600">{{ __('Ticket Title') }}</h4>
                            <p class="text-lg text-gray-700">{{ $ticket->title_name }}</p>
                        </div>
                        <div class="flex items-center">
                            <span class="text-sm font-semibold text-gray-500 mr-2">{{ __('Status:') }}</span>
                            <span class="px-3 py-1 inline-flex text-sm font-medium rounded-full 
                                {{ $ticket->status === 'Closed' ? 'bg-red-200 text-red-800' : 'bg-green-200 text-green-800' }}">
                                {{ ucfirst($ticket->status) }}
                            </span>
                        </div>
                    </div>

                    <!-- Issue Details -->
                    <div>
                        <h4 class="text-lg font-medium text-indigo-600">{{ __('Issue Details') }}</h4>
                        <p class="text-gray-700">{{ $ticket->issues_details }}</p>
                    </div>

                    <!-- Attachments -->
                    <div>
                        <h4 class="text-lg font-medium text-indigo-600">{{ __('Attachments') }}</h4>
                        @if(isset($ticket->attachment) && is_array($ticket->attachment))
                            @if(count($ticket->attachment) > 0)
                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mt-4">
                                    @foreach($ticket->attachment as $image)
                                        <div class="border rounded-md overflow-hidden">
                                            <img src="{{ asset($image) }}" alt="Attachment" class="w-full h-auto">
                                        </div>
                                    @endforeach
                                </div>
                            @else
                                <p class="text-gray-500">No attachments available.</p>
                            @endif
                        @else
                            <p class="text-gray-500">No attachments available.</p>
                        @endif
                    </div>

                    <!-- User Information -->
                    <div class="bg-gray-100 p-4 rounded-lg shadow-sm">
                        <h4 class="text-lg font-medium text-indigo-600">{{ __('User Information') }}</h4>
                        <p class="text-gray-700"><strong>{{ $user->name }}</strong> ({{ $user->email }})</p>
                    </div>

                    <!-- Conversation Section -->
                    <div>
                        <h4 class="text-lg font-medium text-indigo-600">{{ __('Conversation') }}</h4>
                        <div class="mt-4 space-y-6">
                            @foreach($ticket->conversations as $conversation)
                                <div class="bg-gray-100 p-4 rounded-lg shadow-sm">
                                    <div class="flex items-start justify-between">
                                        <div>
                                            <strong class="text-gray-800">{{ $conversation->user->name }}</strong>
                                            <span class="text-gray-500 text-sm">{{ $conversation->created_at->diffForHumans() }}</span>
                                        </div>
                                    </div>
                                    <p class="mt-2 text-gray-700">{{ $conversation->issues_details }}</p>
                                    <!-- Attachment display -->
                                    @if(!empty($conversation->attachment))
                                        <div class="mt-2">
                                            @foreach(json_decode($conversation->attachment) as $file)
                                                <div class="border rounded-md p-2 mb-2">
                                                    <a href="{{ asset($file) }}" class="text-indigo-600" target="_blank">{{ basename($file) }}</a>
                                                </div>
                                            @endforeach
                                        </div>
                                    @endif
                                </div>
                            @endforeach
                        </div>
                    </div>

                    <!-- Add New Conversation -->
                    @if($ticket->status !== 'Closed')
                        <div>
                            <h4 class="text-lg font-medium text-indigo-600">{{ __('Add New Message') }}</h4>
                            <form action="{{ route('conversation.store', ['ticket' => $ticket->id]) }}" method="POST" enctype="multipart/form-data" class="space-y-4 mt-4">
                                @csrf
                                <input type="hidden" name="ticket_id" value="{{ $ticket->id }}">

                                <div>
                                    <textarea name="issues_details" rows="4" class="w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" placeholder="Enter your message" required></textarea>
                                </div>

                                <!-- Image Attachment -->
                                <div>
                                    <label for="attachment" class="block text-sm font-medium text-gray-700">{{ __('Attach Image') }}</label>
                                    <input id="attachment" name="attachment[]" type="file" multiple class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                </div>

                                <!-- Status Selection -->
                                <div>
                                    <label for="status" class="block text-sm font-medium text-gray-700">{{ __('Status') }}</label>
                                    <select id="status" name="status" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                                        <option value="" disabled selected>Select Status</option>
                                        <option value="Active" selected>Active</option>
                                        <option value="Closed">Closed</option>
                                    </select>
                                </div>

                                <!-- Submit Button -->
                                <div>
                                    <button type="submit" class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-semibold py-2 rounded-md shadow-md focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 transition duration-200 ease-in-out">
                                        {{ __('Send Message') }}
                                    </button>
                                </div>
                            </form>
                        </div>
                    @else
                        <div class="p-4 bg-red-100 border-l-4 border-red-500 text-red-700 rounded-md">
                            {{ __('This ticket has been closed. You cannot add new messages.') }}
                        </div>
                    @endif

                </div>
            </div>
        </div>
    </div>
</x-app-layout>
