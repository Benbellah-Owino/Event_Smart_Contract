<script lang="ts">
	console.log();
</script>

<div
	class="navbar sticky w-16 md:w-24 h-screen m-0 top-0 left-0 flex flex-col justify-around items-center border-r border-black"
>
	<button
		id="events"
		class="nav_btn w-14 h-8 border border-black rounded-lg duration-300 hover:shadow-md hover:shadow-yellow-300"
		on:click={() => {
			window.open('/events', '_self');
		}}>events</button
	>
	<button
		id="tickets"
		class="nav_btn w-14 h-8 border border-black rounded-lg duration-300 hover:shadow-md hover:shadow-yellow-300"
		on:click={() => {
			window.open('/ticket', '_self');
		}}>tickets</button
	>
	<button
		id="organizers"
		class="nav_btn w-16 h-8 border border-black rounded-lg duration-300 hover:shadow-md hover:shadow-yellow-300 text-xs"
		on:click={() => {
			window.open('/organizers', '_self');
		}}>organizers</button
	>
	<button
		id="mypage"
		class="nav_btn w-14 h-8 border border-black rounded-lg duration-300 hover:shadow-md hover:shadow-yellow-300"
		on:click={() => {
			window.open('/user', '_self');
		}}>mypage</button
	>
</div>

<style>
	@media only screen and (max-width: 640px) {
		button {
			font-size: 12px;
			width: 3rem;
		}

		#organizers {
			width: 3.5rem;
		}
	}
</style>
