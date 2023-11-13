import { type Writable, writable } from 'svelte/store';
import type { Event } from '$lib/interfaces/event';

export const events: Writable<Event[]> = writable([]);
