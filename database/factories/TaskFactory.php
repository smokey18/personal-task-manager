<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class TaskFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => random_int(1, 10),
            'title' => $this->faker->sentence(5),
            'description' => $this->faker->paragraph(),
            'due_date' => $this->faker->date(),
            'status' => $this->faker->randomElement(['Not Started', 'In Progress', 'Completed']),
        ];
    }
}
