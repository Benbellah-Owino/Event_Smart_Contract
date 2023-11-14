<script lang="ts">
	import type { UserRegisterType } from '$lib/interfaces/user';

	let user: UserRegisterType = {
		email: '',
		password: '',
		wallet_address: '',
		username: ''
	};

	let confirmPassword: string = '';
	async function create() {
		if (confirmPassword != user.password) {
			alert("Passwords don't match");
			return;
		}
		let empty_field: string[] = [];
		for (const key in user) {
			if (user[key] == '') {
				empty_field.push(key);
			}
		}

		if (empty_field.length > 0) {
			console.log(empty_field);
			return;
		}

		console.log(user);

		try {
			await fetch(`http://192.168.100.11:3000/api/v1/user/register`, {
				method: 'POST',

				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(user)
			})
				.then((response) => response.json())
				.then((data) => {
					console.log(data);
					if (data.status == 'success') {
						window.open('/user/login', '_self');
					}
				});
		} catch (error) {
			console.error(error);
		}
	}
</script>

<main class="create_event h-full w-full flex flex-col justify-start items-center">
	<div class="cont name">
		<label for="name">username</label>
		<input type="text" name="name" id="name" bind:value={user.username} />
	</div>
	<div class="cont email">
		<label for="email">email</label>
		<input type="email" name="email" id="email" bind:value={user.email} />
	</div>
	<div class="cont wallet">
		<label for="wallet">wallet address</label>
		<input type="text" name="wallet" id="wallet" bind:value={user.wallet_address} />
	</div>
	<div class="cont passoword">
		<label for="password">password</label>
		<input type="password" name="password" id="password" bind:value={user.password} />
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
