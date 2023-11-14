<script lang="ts">
	import type { EventToCreate, EventHourRange } from '$lib/interfaces/event';

	let hour_range: EventHourRange = {
		arrival: '',
		depature: ''
	};
	let event: EventToCreate = {
		tickets_sold: 0,
		name: '',
		opening: '',
		closing: '',
		price: '',
		status: 'AVAILABLE',
		tickets_quantity: 0,
		description: '',

		hour_range: hour_range
	};

	async function create() {
		let empty_field: string[] = [];
		for (const key in event) {
			if (event[key] == '' && key != 'tickets_sold') {
				empty_field.push(key);
			} else if (event['hour_range'].arrival == '' || event.hour_range.depature == '') {
				console.log('null');
				empty_field.push('arrival or depature');
			}
		}

		if (empty_field.length > 0) {
			console.log(empty_field);
			return;
		}

		event.opening = new Date(event.opening);
		event.closing = new Date(event.closing);
		console.log(event);

		try {
			await fetch(`http://192.168.100.11:3000/api/v1/event/create`, {
				method: 'POST',
				mode: 'cors',
				credentials: 'include',
				headers: {
					'Content-Type': 'application/json',
					AuthToken: localStorage.getItem('token')
				},
				body: JSON.stringify(event)
			})
				.then((response) => response.json())
				.then((data) => {
					console.log('res');
					console.log(data);
				});
		} catch (error) {
			console.error(error);
		}
	}
</script>

<main class="create_event h-full w-full flex flex-col justify-start items-center">
	<div class="cont name">
		<label for="name">Name/title</label>
		<input type="text" name="name" id="name" bind:value={event.name} />
	</div>
	<div class="cont venue">
		<label for="venue">Venue</label>
		<input type="text" name="venue" id="venue" bind:value={event.venue} />
	</div>
	<div class="cont price">
		<label for="price">price in $</label>
		<input type="number" name="price" id="price" bind:value={event.price} />
	</div>
	<div class="cont tickets_quantity">
		<label for="name">No of tickets</label>
		<input
			type="number"
			name="tickets_quantity"
			id="tickets_quantity"
			bind:value={event.tickets_quantity}
		/>
	</div>

	<div class="cont arrival">
		<label for="arrival">time event starts</label>
		<input type="text" name="arrival" id="arrival" bind:value={event.hour_range.arrival} />
	</div>

	<div class="cont depature">
		<label for="depature">time event stops</label>
		<input type="text" name="depature" id="depature" bind:value={event.hour_range.depature} />
	</div>

	<div class="cont opening">
		<label for="opening">date event starts</label>
		<input type="date" name="opening" id="opening" bind:value={event.opening} />
	</div>
	<div class="cont opening">
		<label for="opening">date event ends</label>
		<input type="date" name="closing" id="closing" bind:value={event.closing} />
	</div>

	<div class="desc_cont flex flex-col justify-start items-center">
		<label for="description">description</label>
		<textarea
			name="description"
			class=" border border-black"
			id="description"
			cols="30"
			rows="10"
			bind:value={event.description}
		/>
	</div>

	<button
		class="create w-20 h-8 mt-8 rounded-lg bg-white border-blue-500 font-bold text-blue-700 duration-300 hover:bg-blue-500 hover:text-white"
		id="create"
		on:click={create}>CREATE</button
	>
</main>

<style>
	.cont {
		margin: 12px 0 12px 0;
		width: 60%;
		padding: 8px;
		border: 1px solid pink;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	input {
		width: 50%;
		height: 40px;
		font-size: 16px;
	}

	label {
		font-weight: bold;
		font-size: 24px;
		color: #484848;
	}
</style>
