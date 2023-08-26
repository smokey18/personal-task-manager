<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        \App\Models\User::factory()->create([
            'name' => 'John Doe',
            'email' => 'user@gmail.com',
            'password' => bcrypt('12345678'),
        ]);

        \App\Models\User::factory(9)->create();
        \App\Models\Task::factory(50)->create();
    }
}
