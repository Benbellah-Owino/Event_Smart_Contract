<script lang="ts">
	import type { UserLoginType } from '$lib/interfaces/user';
	import { json } from '@sveltejs/kit';

	let password: string = '';
	let identifier: string = '';

	async function login() {
		let user: UserLoginType = {
			identifier,
			password
		};

		console.log(user);

		try {
			await fetch(`http://192.168.100.11:3000/api/v1/user/login`, {
				method: 'POST',
				mode: 'cors',
				credentials: 'include',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(user)
			})
				.then((response) => response.json())
				.then((data) => {
					console.log('res');
					console.log(data);
					localStorage.setItem("token", data.token)
				});
		} catch (error) {
			console.error(error);
		}
	}
</script>

<main class="login w-full h-full flex flex-col justify-start items-center">
	<section id="logo" class="w-52 h-40 mt-8 border border-black">p</section>
	<div class="textboxes w-10/12 bg-slate-50 mt-8 p-4 flex flex-col justify-start items-center">
		<input
			type="text"
			name="identifier"
			id="identifier"
			class="identifier mt-4"
			bind:value={identifier}
			placeholder="Enter username or email"
		/>
		<input
			class="mt-6"
			type="password"
			name="password"
			id="password"
			bind:value={password}
			placeholder="Enter password"
		/>
	</div>
	<button
		id="login"
		class="login mt-8 w-14 h-8 rounded-md bg-blue-600 font-bold text-white"
		on:click={login}>login</button
	>
</main>

<style>
	input {
		width: 90%;
		height: 32px;
		text-align: left;
	}

	button {
		transition: all ease-in-out 0.5s;
	}

	button:hover {
		background: rgb(240, 189, 1);
		background: -moz-linear-gradient(
			180deg,
			rgba(240, 189, 1, 1) 0%,
			rgba(180, 9, 247, 0.9920343137254902) 66%,
			rgba(53, 4, 230, 1) 100%
		);
		background: -webkit-linear-gradient(
			180deg,
			rgba(240, 189, 1, 1) 0%,
			rgba(180, 9, 247, 0.9920343137254902) 66%,
			rgba(53, 4, 230, 1) 100%
		);
		background: linear-gradient(
			180deg,
			rgba(240, 189, 1, 1) 0%,
			rgba(180, 9, 247, 0.9920343137254902) 66%,
			rgba(53, 4, 230, 1) 100%
		);
	}
</style>
