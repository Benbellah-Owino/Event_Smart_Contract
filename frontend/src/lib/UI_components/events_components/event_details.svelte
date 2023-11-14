<script lang="ts">
	import OrganizerTile from '$lib/UI_components/user_components/organizer.svelte';
	import DateTime from '$lib/UI_components/events_components/date_time.svelte';
	import Navbar from '$lib/UI_components/major_components/navbar.svelte';
	import type { Event } from '$lib/interfaces/event';
	import { event_details_on } from '$lib/stores/event';
	export let event: Event;

	console.log(event);
</script>

<Navbar />

<main
	class="event_main top-0 left-16 absolute w-10/12 md:ml-28 p-2 md:w-4/5 bg-slate-50 flex flex-col justify-start items-center"
>
	<button
		class="close w-7 h-7 absolute top-3 right-3 rounded-full border border-red-500 bg-white text-red-500 duration-300 hover:bg-red-500 hover:text-white"
		id="close"
		on:click={() => ($event_details_on = false)}>x</button
	>
	<img alt="event logo" class="banner w-8/12 h-1/5 bg-green-200" id="banner" />
	<h1 class="event_name mt-7 text-6xl font-bold">
		{event.name}
	</h1>

	<p class="description mt-2 text-sm" id="description">
		{event.descriptions}
	</p>
	<span class="" />
	<OrganizerTile />

	<!--section Date time sections -->

	<section
		class="date_time w-11/12 h-fit p-6 mt-4 flex flex-col justify-start items-start bg-slate-200"
		id="date_time"
	>
		<DateTime />
	</section>
	<!--End Date time sections -->

	<!-- section: 			Location -->
	<h1 class="">Location</h1>
	<section class="location p-2" id="location">
		<h3 class="bold">{event.venue}</h3>
	</section>
	<!-- end of section: 	Location -->

	<h3 class="tickets_left mt-7" id="tickets_left">
		Tickets left: {event.tickets_quantity - event.tickets_sold}
	</h3>
	<button
		class="buy_ticket w-24 h-10 mt-3 border border-white rounded bg-blue-500 font-bold text-white hover:shadow-lg hover:shadow-blue-500 hover:border-none"
		id="but_ticket">buy</button
	>
</main>

<style>
	.event_main {
		height: 100vh;
	}

	h1 {
		font-weight: bold;
	}
</style>
