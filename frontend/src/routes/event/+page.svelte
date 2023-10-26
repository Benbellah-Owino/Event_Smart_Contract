<script lang="ts">
	import OrganizerTile from '$lib/user_components/organizer.svelte';
	import DateTime from '$lib/events_components/date_time.svelte';
</script>

<main class="event_main w-full p-2 flex flex-col justify-start items-center">
	<img alt="event logo" class="banner w-8/12 h-1/5 bg-green-200" id="banner" />
	<h1 class="event_name mt-7 text-3xl font-bold">
		This is an event. I'm making this shit long for no reason
	</h1>

	<p class="description mt-2 text-sm" id="description">
		Lorem ipsum dolor sit amet consectetur adipisicing elit. Est cupiditate illum nobis, dolorum
		aliquam, culpa nemo esse ab ratione nihil praesentium sapiente saepe maiores cum laborum, dolor
		autem. Iure, at.
	</p>
	<span class="" />
	<OrganizerTile />

	<!--section Date time sections -->
	<h1 class="dt_title mt-7" id="dt_title">Date and Time</h1>
	<section
		class="date_time w-11/12 h-fit p-6 flex flex-col justify-start items-start bg-slate-200"
		id="date_time"
	>
		<DateTime />
	</section>
	<!--End Date time sections -->

	<!-- section: 			Location -->
	<h1 class="">Location</h1>
	<section class="location p-2" id="location">
		<h3 class="bold">Radisson Blu Hotel, Nairobi Upper Hill</h3>
	</section>
	<!-- end of section: 	Location -->

	<h3 class="tickets_left mt-7" id="tickets_left">Tickets left: 23</h3>
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
		font-size: 24px;
		font-weight: bold;
	}
</style>
