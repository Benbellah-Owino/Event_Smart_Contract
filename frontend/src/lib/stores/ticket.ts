import { type Writable, writable } from 'svelte/store';
import type { Ticket } from '$lib/interfaces/ticket';

export const tickets: Writable<Ticket[]> = writable([]);
