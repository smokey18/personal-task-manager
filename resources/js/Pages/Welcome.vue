<script setup>
import { Head, Link } from '@inertiajs/vue3';

defineProps({
    canLogin: {
        type: Boolean,
    },
    canRegister: {
        type: Boolean,
    },
    laravelVersion: {
        type: String,
        required: true,
    },
    phpVersion: {
        type: String,
        required: true,
    },
});
</script>

<template>
    <Head title="Home" />

    <div class="flex justify-center items-center min-h-screen bg-gray-100">
        <div class="card text-center w-96">
            <h1 class="text-4xl font-semibold mb-4 text-black">Personal Task Manager</h1>

            <div v-if="canLogin" class="p-6 text-center flex justify-center">
                <Link v-if="$page.props.auth.user" :href="route('dashboard')"
                    class="block font-semibold text-gray-600 hover:text-gray-900 focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500 mx-2">
                Dashboard</Link>

                <template v-else>
                    <Link :href="route('login')"
                        class="block font-semibold text-gray-600 hover:text-gray-900 focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500 mx-2">
                    Log in</Link>

                    <Link v-if="canRegister" :href="route('register')"
                        class="block font-semibold text-gray-600 hover:text-gray-900 focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500 mx-2">
                    Register</Link>
                </template>
            </div>
        </div>
    </div>
</template>

<style scoped>
.card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    padding: 30px;
    width: 480px;
    margin-top: -100px;
}
</style>
