<script lang>
	import Ticket from '$lib/UI_components/ticket/ticket.svelte';
	import { onMount } from 'svelte';
	onMount(async () => {
		await fetch(`http://192.168.100.11:3000/`, {
			credentials: 'include',

			headers: {
				'Content-Type': 'application/json'
			}
		})
			.then((response) => response.json())
			.then((data) => {
				console.log(data);
			});
	});
</script>

<main class="flex justify-center items-center">
	<br /><br />
</main>
