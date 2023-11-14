<script lang="ts">
	import Navbar from '$lib/UI_components/major_components/navbar.svelte';
	import EventTile from '$lib/UI_components/events_components/event_tile.svelte';
	import { onMount } from 'svelte';
	import { events, event_details_on, curr_event } from '$lib/stores/event';
	import EventDetails from '$lib/UI_components/events_components/event_details.svelte';

	let event: Event;
	onMount(async () => {
		await fetch(`http://192.168.100.11:3000/api/v1/event/get_all `, {
			credentials: 'include',
			headers: {
				'Content-Type': 'application/json'
			}
		})
			.then((response) => response.json())
			.then((data) => {
				$events = data.events;
				console.log($events);
			});
	});
</script>

<div class="main_events flex justify-start" id="main_events">
	<Navbar />
	<div
		class="events w-full h-full md:ml-36 pt-2 flex flex-col justify-start items-center md:flex md:flex-col md:justify-start md:items-center lg:grid lg:grid-cols-2 xl:grid xl:grid-cols-3"
	>
		{#each $events as event (event.id)}
			<EventTile {event} />
		{/each}
	</div>

	{#if $event_details_on == true}
		<EventDetails event={$curr_event} />
	{/if}
</div>

<style>
	.events {
		row-gap: 4rem;
	}
</style>
