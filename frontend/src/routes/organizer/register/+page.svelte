<script lang="ts">
	import type { OrganizerRegisterType, Socials } from '$lib/interfaces/organizer';

	let organizer: OrganizerRegisterType = {
		email: '',
		password: '',
		wallet_address: '',
		username: '',
		phone: [],
		socials: {
			twitter: '',
			instagram: '',
			facebook: ''
		}
	};

	let confirmPassword: string = '';
	async function create() {
		if (confirmPassword != organizer.password) {
			alert("Passwords don't match");
			return;
		}
		let empty_field: string[] = [];
		for (const key in organizer) {
			if (organizer[key] == '') {
				empty_field.push(key);
			}
		}

		if (empty_field.length > 0) {
			console.log(empty_field);
			return;
		}

		console.log(organizer);

		try {
			await fetch(`http://192.168.100.11:3000/api/v1/organizer/register`, {
				method: 'POST',

				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(organizer)
			})
				.then((response) => response.json())
				.then((data) => {
					console.log(data);
					if (data.status == 'success') {
						window.open('/organizer/login', '_self');
					}
				});
		} catch (error) {
			console.error(error);
		}
	}
</script>

<main class="create_event h-full w-full flex flex-col justify-start items-center">
	<div class="cont name">
		<label for="name">organizer name</label>
		<input type="text" name="name" id="name" bind:value={organizer.username} />
	</div>
	<div class="cont email">
		<label for="email">email</label>
		<input type="email" name="email" id="email" bind:value={organizer.email} />
	</div>
	<div class="cont wallet">
		<label for="wallet">wallet address</label>
		<input type="text" name="wallet" id="wallet" bind:value={organizer.wallet_address} />
	</div>
	<div class="cont passoword">
		<label for="password">password</label>
		<input type="password" name="password" id="password" bind:value={organizer.password} />
	</div>
	<div class="cont confirmpassoword">
		<label for="confirmpassword">confirm password</label>
		<input
			type="password"
			name="confirmpassword"
			id="confirmpassword"
			bind:value={confirmPassword}
		/>
	</div>

	<div class="cont phone_number">
		<label for="x">phone</label>
		<input type="text" name="x" id="x" bind:value={organizer.phone} />
	</div>
	<div class="cont socials twitter">
		<label for="x">X/ TWITER</label>
		<input type="text" name="x" id="x" bind:value={organizer.socials.twitter} />
	</div>
	<div class="cont socials instagram">
		<label for="instagram">instagram</label>
		<input type="text" name="instagram" id="instagram" bind:value={organizer.socials.instagram} />
	</div>
	<div class="cont socials facebook">
		<label for="facebook">facebook</label>
		<input type="text" name="facebook" id="facebook" bind:value={organizer.socials.facbook} />
	</div>

	<button
		class="create w-20 h-8 mt-8 rounded-lg bg-white border-blue-500 font-bold text-blue-700 duration-300 hover:bg-blue-500 hover:text-white"
		id="create"
		on:click={create}>REGISTER</button
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
