<?php

namespace App\Http\Controllers;

use Inertia\Inertia;
use App\Models\Task;
use Illuminate\Http\Request;

class TaskController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $tasks = Task::where('user_id', auth()->id())
            ->when(request('search'), function ($query, $search) {
                $query->where('title', 'LIKE', "%{$search}%")
                    ->orWhere('description', 'LIKE', "%{$search}%");
            })
            ->when(request('status'), function ($query, $status) {
                $query->where('status', $status);
            })
            ->paginate(5);
        return Inertia::render('Tasks/Index', ['tasks' => $tasks]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('Tasks/Create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => ['required'],
            'description' => ['required'],
            'due_date' => ['required'],
            'status' => ['required', 'in:Not Started,In Progress,Completed'],
        ]);

        Task::create([
            'user_id' => auth()->id(),
            'title' => $request['title'],
            'description' => $request['description'],
            'due_date' => $request['due_date'],
            'status' => $request['status'],
        ]);

        return redirect()->route('tasks.index')->with('success', 'Task created.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Task $task)
    {
        $task = Task::where('user_id', auth()->id())
            ->where('id', $task->id)
            ->firstOrFail();

        return Inertia::render('Tasks/Show', ['task' => $task]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Task $task)
    {
        $task = Task::where('user_id', auth()->id())
            ->where('id', $task->id)
            ->firstOrFail();

        return Inertia::render('Tasks/Edit', ['task' => $task]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => ['required'],
            'description' => ['required'],
            'due_date' => ['required'],
            'status' => ['required', 'in:Not Started,In Progress,Completed'],
        ]);

        Task::findOrFail($id)->update([
            'user_id' => auth()->id(),
            'title' => $request['title'],
            'description' => $request['description'],
            'due_date' => $request['due_date'],
            'status' => $request['status'],
        ]);

        return redirect()->route('tasks.index')->with('success', 'Task updated.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        Task::findOrFail($id)->delete();

        return redirect()->route('tasks.index')->with('success', 'Task deleted.');
    }
}
