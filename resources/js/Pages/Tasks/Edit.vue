<script setup>
import BreezeAuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import InputError from '@/components/InputError.vue';
import InputLabel from '@/components/InputLabel.vue';
import TextInput from '@/components/TextInput.vue';
import TextArea from '@/components/TextArea.vue';
import InputSelect from '@/components/InputSelect.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';

const props = defineProps({
    task: Object,
});

const form = useForm({
    title: props.task.title,
    description: props.task.description,
    due_date: props.task.due_date,
    status: props.task.status,
});

const submit = () => {
    form.put(route('tasks.update', props.task.id));
};

</script>

<template>
    <Head title="Edit Task" />

    <BreezeAuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                Edit Task
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">

                        <form name="updateForm" @submit.prevent="submit">
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
                                        { label: 'Not Started', value: 'Not Started', editedValue: 'Not Started' },
                                        { label: 'In Progress', value: 'In Progress', editedValue: 'In Progress' },
                                        { label: 'Completed', value: 'Completed', editedValue: 'Completed' },
                                    ]" />

                                    <InputError class="mt-2" :message="form.errors.status" />
                                </div>

                            </div>

                            <div className="mt-4">
                                <button type="submit" className="px-6 py-2 font-bold text-white bg-yellow-500 rounded">
                                    Update
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </BreezeAuthenticatedLayout>
</template>
