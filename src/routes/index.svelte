<script lang="ts">
    import { onMount } from "svelte";
    import { session } from "$app/stores";

    const todoAPIURL = $session.todoAPIURL;

    interface Todo {
        todo: string;
        priority: number;
    }

    let todos: Todo[] = [];
    async function updateTodos() {
        const res = await fetch(`${todoAPIURL}/todos/`);
        todos = await res.json();
    }

    onMount(() => {
        updateTodos();
    });

    let newTodo = "";
    async function handleSubmit(e: Event) {
        if (!newTodo) return;

        await fetch(`${todoAPIURL}/todos/`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                todo: newTodo,
                priority: 0
            })
        });

        updateTodos();
        newTodo = "";
    }
</script>

<h1>Welcome to SvelteKit</h1>

<form action="${todoAPIURL}/todos/" method="post" on:submit|preventDefault={handleSubmit}>
    <input name="text" aria-label="Add todo" placeholder="add a todo" bind:value={newTodo} />
</form>

{#each todos as todo (todo.todo)}
    <p>
        {todo.todo}
        <button
            on:click={async () => {
                await fetch(`${todoAPIURL}/todos/${todo.todo}`, {
                    method: "DELETE"
                });
                updateTodos();
            }}>X</button
        >
    </p>
{/each}
