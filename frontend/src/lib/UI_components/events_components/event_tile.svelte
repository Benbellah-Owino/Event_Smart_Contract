<script lang="ts">
	import type { Event } from '$lib/interfaces/event';
	export let event: Event;

	let price: number;
	if (typeof event.price === 'string') {
		price = parseInt(event.price);
	} else {
		price = event.price;
	}

	const opening_iso = new Date(event.opening);
	let opening = `${opening_iso.toLocaleDateString('en-US', {
		weekday: 'long'
	})} ${opening_iso.getDay()} ${opening_iso.toLocaleDateString('en-US', {
		month: 'long'
	})} ${opening_iso.getFullYear()}`;
</script>

<main
	class="event_tile w-64 h-52 md:w-80 md:h-64 mb-8 border border-black rounded-lg cursor-pointer duration-300 hover:border-purple-400"
	id="event_tile "
>
	<div class="logo h-16 md:h-32 rounded-t-lg bg-blue-200" id="log">H</div>
	<h1 class="event_title ml-2 mb-3 font-bold text-lg" id="event_title">
		{event.name}
	</h1>
	<div class="more_info w-full flex justify-between row text-sm" id="more_info">
		<h3 class="venue w-2/3 ml-2" id="venue"><b>Venue: </b>{event.venue}</h3>
		<h3 class="price w-1/3" id="id"><b>price: </b>{price}</h3>
	</div>
	<h3 class="date_time ml-2 mt-2 text-sm" id="data_time">{opening} {event.hour_range.arrival}</h3>
	<div class="footer h-7 rounded-lg bg-red-50">
		<h3 class="tickets_remaining ml-2 mt-2 text-sm" id="tickets_remaining">
			{event.tickets_quantity - event.tickets_sold}
		</h3>
		<button
			class="learn_more w-30 border border-black rounded-lg bg-yellow-300 text-xs md:text-sm md:font-bold duration-300 hover:bg-black hover:text-yellow-300 hover:shadow-lg hover:shadow-yellow-300"
			id="learn_more">LEARN MORE</button
		>
	</div>
</main>
