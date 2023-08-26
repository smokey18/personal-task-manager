<script setup>
import { onMounted, ref } from 'vue';

defineProps({
    modelValue: {
        type: String,
        required: true,
    },
    options: {
        type: Array,
        required: true,
    },
    editedValue: {
        type: String,
        required: false,
        default: null,
    },
});

defineEmits(['update:modelValue']);

const select = ref(null);

onMounted(() => {
    if (select.value.hasAttribute('autofocus')) {
        select.value.focus();
    }
});

defineExpose({
    focus: () => select.value.focus(),
});
</script>

<template>
    <select
        class="form-select block mt-1 border-gray-300 focus:border-indigo-500 focus:ring-indigo-500 rounded-md shadow-sm"
        :value="editedValue || modelValue" @input="$emit('update:modelValue', $event.target.value)" ref="select">
        <option v-for="option in options" :value="option.value" :key="option.value" :disabled="option.disabled" :selected="option.value === modelValue">
            {{ option.label }}
        </option>
    </select>
</template>
