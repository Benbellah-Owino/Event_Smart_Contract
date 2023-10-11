<script lang="ts">
	import Navbar from '$lib/major_components/navbar.svelte';
	import EventTile from '$lib/events_components/event_tile.svelte';
</script>

<div class="main_events flex justify-start" id="main_events">
	<Navbar />
	<div class="events w-full h-full ml-16 md:ml-36 pt-2 pl-10 lg:grid lg:grid-cols-3">
		<EventTile />
		<EventTile />
		<EventTile />
		<EventTile />
		<EventTile />
		<EventTile />
		<EventTile />
	</div>
</div>
