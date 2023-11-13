<script lang="ts">
	import Navbar from '$lib/UI_components/major_components/navbar.svelte';
	import EventTile from '$lib/UI_components/events_components/event_tile.svelte';
</script>

<div class="main_events flex justify-start" id="main_events">
	<Navbar />
	<div
		class="events w-full h-full md:ml-36 pt-2 flex flex-col justify-start items-center md:flex md:flex-col md:justify-start md:items-center lg:grid lg:grid-cols-2 xl:grid xl:grid-cols-3"
	>
		<EventTile />
		<EventTile />
		<EventTile />
		<EventTile />
		<EventTile />
		<EventTile />
		<EventTile />
	</div>
</div>

<style>
	.events {
		row-gap: 4rem;
	}
</style>
