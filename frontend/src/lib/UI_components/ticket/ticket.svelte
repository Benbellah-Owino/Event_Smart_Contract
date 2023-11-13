<script lang="ts">
	import type { Ticket } from '$lib/interfaces/ticket';

	export let ticket: Ticket;

	const date = new Date(ticket.time_issued);
	let time_issued = `${date.getDate()}-${date.getMonth()}-${date.getFullYear()}`;

	const opening_iso = new Date(ticket.event.opening);
	let opening = `${opening_iso.toLocaleDateString('en-US', {
		weekday: 'long'
	})} ${opening_iso.getDay()} ${opening_iso.toLocaleDateString('en-US', {
		month: 'long'
	})} ${opening_iso.getFullYear()}`;

	const closing_iso = new Date(ticket.event.closing);
	let closing = `${closing_iso.toLocaleDateString('en-US', {
		weekday: 'long'
	})}  ${closing_iso.getDate()} ${closing_iso.toLocaleDateString('en-US', {
		month: 'long'
	})} ${closing_iso.getFullYear()}`;
</script>

<div class="ticket h-72 mb-14 flex items-center border-2 border-black bg-gray-100" id="ticket">
	<div class="poster h-52 w-72 ml-5 border border-black" id="poster"><img src="" alt="" /></div>
	<div class="details h-5/6 w-7/12 ml-5 flex flex-col justify-center" id="details">
		<span class="w-full text-center font-bold text-3xl">{ticket.event.description}</span>
		<p class="venue" id="venue"><b>VENUE: </b>{ticket.event.venue}</p>
		<p class="dates" id="dates"><b>Dates: </b>{opening} - {closing}</p>
		<p class="date_issued" id="date_issued"><b>Date Issued: </b>{time_issued}</p>
		<p class="user_wallet" id="user_wallet"><b>User Wallet: </b>{ticket.user.wallet}</p>
		<p class="user_wallet" id="user_wallet"><b>User email: </b>{ticket.user.email}</p>
		<p class="ticket_id" id="ticket_id"><b>Ticket ID: </b>{ticket.id}</p>
		<p class="ticket_id" id="ticket_id"><b>Ticket type: </b>{ticket.type}</p>
		<p class="ticket_id" id="ticket_id"><b>price: </b>{ticket.price}</p>
	</div>
</div>

<style>
	.ticket {
		width: 50rem;
		font-family: 'Courier New', Courier, monospace;
	}
</style>
