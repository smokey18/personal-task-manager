<script setup>
import BreezeAuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import BreezeLabel from '@/Components/InputLabel.vue';
import BreezeInput from '@/Components/TextInput.vue';
import BreezeTextArea from '@/Components/TextArea.vue';
import BreezeSelect from '@/Components/BreezeSelect.vue';
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

                                    <BreezeLabel for="title" value="Title" />

                                    <BreezeInput id="title" type="text" class="mt-1 block w-full" v-model="form.title"
                                        autofocus />

                                    <span className="text-red-600" v-if="form.errors.title">
                                        {{ form.errors.title }}
                                    </span>
                                </div>

                                <div className="mb-4">

                                    <BreezeLabel for="description" value="Description" />

                                    <BreezeTextArea id="description" class="mt-1 block w-full" v-model="form.description" />

                                    <span className="text-red-600" v-if="form.errors.description">
                                        {{ form.errors.description }}
                                    </span>
                                </div>

                                <div className="mb-4">

                                    <BreezeLabel for="due_date" value="Due Date" />

                                    <BreezeInput id="due_date" type="date" class="mt-1 block w-full"
                                        v-model="form.due_date" />

                                    <span className="text-red-600" v-if="form.errors.due_date">
                                        {{ form.errors.due_date }}
                                    </span>
                                </div>

                                <div className="mb-4">

                                    <BreezeLabel for="status" value="Status" />

                                    <BreezeSelect id="status" class="mt-1 block w-full" v-model="form.status" :options="[
                                        { label: 'Select Status', value: '', disabled: true, selected: true },
                                        { label: 'Not Started', value: 'Not Started' },
                                        { label: 'In Progress', value: 'In Progress' },
                                        { label: 'Completed', value: 'Completed' },
                                    ]" />

                                    <span className="text-red-600" v-if="form.errors.status">
                                        {{ form.errors.status }}
                                    </span>
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
