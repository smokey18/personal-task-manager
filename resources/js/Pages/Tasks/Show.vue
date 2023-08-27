<script setup>
import BreezeAuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import InputLabel from '@/components/InputLabel.vue';
import TextInput from '@/components/TextInput.vue';
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

</script>

<template>
    <Head title="View Task" />

    <BreezeAuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                View Task: {{ props.task.id }}
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">

                        <form>
                            <div className="flex flex-col">
                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700 underline">Title</label>
                                    <span class="mt-1 text-lg">{{ form.title }}</span>
                                </div>

                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700 underline">Description</label>
                                    <p class="mt-1">{{ form.description }}</p>
                                </div>

                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700 underline">Due Date</label>
                                    <span class="mt-1 block">{{ form.due_date }}</span>
                                </div>

                                <div class="mb-4">
                                    <label class="block text-sm font-medium text-gray-700 underline">Status</label>
                                    <span class="mt-1 block">{{ form.status }}</span>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </BreezeAuthenticatedLayout>
</template>
