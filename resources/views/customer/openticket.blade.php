<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Open Ticket') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900">
                    @if ($errors->any())
                        <div class="mb-4">
                            <ul class="list-disc list-inside text-sm text-red-600">
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    @if(session('success'))
                        <div class="mb-4 text-green-600">
                            {{ session('success') }}
                        </div>
                    @endif

                    <form method="POST" action="{{ route('tickets.store') }}" enctype="multipart/form-data">
                        @csrf
                        
                        <!-- Ticket Title -->
                        <div class="mb-4">
                            <label for="title" class="block text-sm font-medium text-gray-700">{{ __('Ticket Title') }}<span style="color:red">*</span></label>
                            <input id="title" name="title_name" type="text" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required>
                        </div>

                        <!-- Issue Details -->
                        <div class="mb-4">
                            <label for="details" class="block text-sm font-medium text-gray-700">{{ __('Issue Details') }}<span style="color:red">*</span></label>
                            <textarea id="details" name="issues_details" rows="5" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" required></textarea>
                        </div>

                        <!-- Image Attachment -->
                        <div class="mb-4">
                            <label for="attachment" class="block text-sm font-medium text-gray-700">{{ __('Attach Image') }} <span style="color:red">*</span></label>
                            <input id="attachment" name="attachment[]" type="file" multiple class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                        </div>
                        

                        <!-- Submit Button -->
                        <div class="mt-6">
                            <button type="submit" class="inline-flex items-center px-4 py-2 
                                bg-indigo-600 
                                border border-transparent 
                                rounded-md font-semibold text-white uppercase tracking-widest 
                                hover:bg-indigo-700 
                                focus:bg-indigo-700 
                                active:bg-indigo-900 
                                focus:outline-none focus:ring focus:ring-indigo-300 
                                disabled:opacity-25 transition ease-in-out duration-150">
                                {{ __('Submit Ticket') }}
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
