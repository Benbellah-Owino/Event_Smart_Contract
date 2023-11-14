import { type Writable, writable } from 'svelte/store';
import type { Event } from '$lib/interfaces/event';

export const events: Writable<Event[]> = writable([]);

export const curr_event: Writable<Event> = writable();

export const event_details_on: Writable<boolean> = writable(false);
