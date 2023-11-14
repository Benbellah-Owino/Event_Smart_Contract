interface TicketUser {
	[key: string]: string;
	email: string;
	wallet: string;
}

interface TicketEvent {
	[key: string]: string | object;
	closing: string;
	hour_range: object;
	opening: string;
	status: string;
	venue: string;
	description: string;
}
export interface Ticket {
	[key: string]: string | number | Date | TicketEvent | TicketUser;
	code: string;
	event: TicketEvent;
	id: string;
	price: number | string;
	status: string;
	time_issued: Date | string;
	type: string;
	user: TicketUser;
}

export interface NewTicket {
	[key: string]: string | number | Date | TicketEvent | TicketUser;
	code: string;
	event: TicketEvent;
	price: number | string;
	status: string;
	type: string;
}
