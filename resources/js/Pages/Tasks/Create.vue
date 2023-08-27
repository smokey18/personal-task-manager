<script setup>
import BreezeAuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import InputError from '@/components/InputError.vue';
import InputLabel from '@/components/InputLabel.vue';
import TextInput from '@/components/TextInput.vue';
import TextArea from '@/components/TextArea.vue';
import InputSelect from '@/components/InputSelect.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';

const form = useForm({
    title: '',
    description: '',
    due_date: '',
    status: '',
});

const submit = () => {
    form.post(route('tasks.store'));
};

</script>

<template>
    <Head title="Create Task" />

    <BreezeAuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Create Task
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">

                        <form name="createForm" @submit.prevent="submit">
                            <div className="flex flex-col">
                                <div className="mb-4">

                                    <InputLabel for="title" value="Title" />

                                    <TextInput id="title" type="text" class="mt-1 block w-full" v-model="form.title"
                                        autofocus />

                                    <InputError class="mt-2" :message="form.errors.title" />
                                </div>

                                <div className="mb-4">

                                    <InputLabel for="description" value="Description" />

                                    <TextArea id="description" class="mt-1 block w-full" v-model="form.description" />

                                    <InputError class="mt-2" :message="form.errors.description" />
                                </div>

                                <div className="mb-4">

                                    <InputLabel for="due_date" value="Due Date" />

                                    <TextInput id="due_date" type="date" class="mt-1 block w-full"
                                        v-model="form.due_date" />

                                    <InputError class="mt-2" :message="form.errors.due_date" />
                                </div>

                                <div className="mb-4">

                                    <InputLabel for="status" value="Status" />

                                    <InputSelect id="status" class="mt-1 block w-full" v-model="form.status" :options="[
                                        { label: 'Select Status', value: '', disabled: true, selected: true },
                                        { label: 'Not Started', value: 'Pending' },
                                        { label: 'In Progress', value: 'In Progress' },
                                        { label: 'Completed', value: 'Completed' },
                                    ]" />

                                    <InputError class="mt-2" :message="form.errors.status" />
                                </div>
                            </div>

                            <div className="mt-4">
                                <button type="submit" className="px-6 py-2 font-bold text-white bg-green-500 rounded">
                                    Save
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </BreezeAuthenticatedLayout>
</template>
