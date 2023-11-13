<script lang="ts">
	import Ticket from '$lib/UI_components/ticket/ticket.svelte';
	import { tickets } from '$lib/stores/ticket';
	import { onMount } from 'svelte';
	let number_of_tickets: number;

	onMount(async () => {
		await fetch(`http://192.168.100.11:3000/api/v1/ticket/get_my`, {
			credentials: 'include',
			headers: {
				'Content-Type': 'application/json',
				AuthToken: localStorage.getItem('token')
			}
		})
			.then((response) => response.json())
			.then((data) => {
				$tickets = data.tickets;
				number_of_tickets = data.no_tickets;
				console.log($tickets[0]);
			});
	});
</script>

<main class=" p-3 flex flex-col justify-center items-center">
	<br /><br />
	{#each $tickets as ticket (ticket.id)}
		<Ticket {ticket} />
	{/each}
</main>
