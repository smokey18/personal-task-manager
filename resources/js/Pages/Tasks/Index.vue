<script setup>
import BreezeAuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { Head, Link, useForm } from '@inertiajs/inertia-vue3';
import { ref, watch } from "vue";
import { Inertia } from "@inertiajs/inertia";
import Pagination from "@/components/Pagination.vue";
import InputSelect from '@/components/InputSelect.vue';
import PrimaryButton from '@/components/PrimaryButton.vue';

const props = defineProps({
    tasks: {
        type: Object,
        default: () => ({}),
    },
    filters: {
        type: Object,
        default: () => ({}),
    },
});

let search = ref(props.filters.search);
let statusFilter = ref(props.filters.status);

async function applyFilters() {
    await Inertia.get(route('tasks.index', {
        search: search.value,
        status: statusFilter.value,
    }));
}

const form = useForm();

function destroy(id) {
    if (confirm("Are you sure you want to delete this task?")) {
        form.delete(route('tasks.destroy', id));
    }
}

function isDueTomorrow(dueDate) {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const due = new Date(dueDate);
    return due.toDateString() === tomorrow.toDateString();
}

function isDueAfterThreeDays(dueDate) {
    const afterThreeDays = new Date();
    afterThreeDays.setDate(afterThreeDays.getDate() + 3);
    const due = new Date(dueDate);
    return due.toDateString() === afterThreeDays.toDateString();
}
</script>

<template>
    <Head title="All Tasks" />

    <BreezeAuthenticatedLayout>
        <template #header>
            <h2 class="font-semibold text-xl text-gray-800 leading-tight">
                All Tasks
            </h2>
        </template>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                    <div class="p-6 bg-white border-b border-gray-200">
                        <div class="flex items-end justify-between mb-6">
                            <Link class="px-4 py-2 text-sm text-white bg-green-500 rounded-md focus:outline-none"
                                :href="route('tasks.create')">
                            Create Task
                            </Link>

                            <form @submit.prevent="applyFilters">
                                <div class="flex justify-between gap-4">

                                    <input type="text" v-model="search" placeholder="Search..."
                                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-60 p-2.5 " />

                                    <InputSelect v-model="statusFilter" :options="[
                                        { label: 'Select Status', value: '' },
                                        { label: 'Not Started', value: 'Not Started', editedValue: 'Not Started' },
                                        { label: 'In Progress', value: 'In Progress', editedValue: 'In Progress' },
                                        { label: 'Completed', value: 'Completed', editedValue: 'Completed' },
                                    ]" />

                                    <PrimaryButton type="submit">
                                        Apply
                                    </PrimaryButton>
                                </div>
                            </form>
                        </div>

                        <div v-if="tasks.data.length === 0" class="text-center text-gray-600 py-4">
                            <span class="text-2xl">No Tasks Found...</span>
                        </div>
                        <table v-else class="w-full">
                            <thead>
                                <tr class="bg-gray-100">
                                    <th class="px-4 py-2 w-20">No.</th>
                                    <th class="px-4 py-2">Title</th>
                                    <th class="px-4 py-2">Description</th>
                                    <th class="px-4 py-2">Due Date</th>
                                    <th class="px-4 py-2">Status</th>
                                    <th class="px-4 py-2">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="task in tasks.data" :key="task.id">
                                    <td class="border px-4 py-2">{{ task.id }}</td>
                                    <td class="border px-4 py-2">{{ task.title }}</td>
                                    <td class="border px-4 py-2">{{ task.description }}</td>
                                    <td class="border px-4 py-2">{{ task.due_date }}</td>
                                    <td class="border px-4 py-2">{{ task.status }}</td>
                                    <td class="border text-center flex justify-center gap-4 px-4 py-10">
                                        <Link tabindex="1" class="px-4 py-2 text-sm text-white bg-yellow-500 rounded"
                                            :href="route('tasks.show', task.id)">
                                        View
                                        </Link>

                                        <Link tabindex="1" class="px-4 py-2 text-sm text-white bg-blue-500 rounded"
                                            :href="route('tasks.edit', task.id)">
                                        Edit
                                        </Link>

                                        <Link tabindex="1" class="mx-1 px-4 py-2 text-sm text-white bg-red-500 rounded"
                                            @click="destroy(task.id)">
                                        Delete
                                        </Link>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <div class="flex justify-center mt-5">
                            <Pagination class="bg-white border-t border-gray-200" :links="tasks.links" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </BreezeAuthenticatedLayout>
</template>
