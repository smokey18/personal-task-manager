<?php

namespace App\GraphQL\Tasks;

use App\Models\Task;
use GraphQL\Type\Definition\ResolveInfo;
use Nuwave\Lighthouse\Support\Contracts\GraphQLContext;

class TaskResolver
{
    public function createTask($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        return Task::create([
            'title' => $args['title'],
            'description' => $args['description'] ?? null,
            'due_date' => $args['due_date'] ?? null,
            'status' => $args['status'] ?? 'Not Started',
        ]);
    }

    public function updateTask($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        $task = Task::findOrFail($args['id']);

        $task->update([
            'title' => $args['title'] ?? $task->title,
            'description' => $args['description'] ?? $task->description,
            'due_date' => $args['due_date'] ?? $task->due_date,
            'status' => $args['status'] ?? $task->status,
        ]);

        return $task;
    }

    public function deleteTask($rootValue, array $args, GraphQLContext $context, ResolveInfo $resolveInfo)
    {
        $task = Task::findOrFail($args['id']);
        $task->delete();

        return true;
    }
}
