export interface EventHourRange {
	[key: string]: string;
	arrival: string;
	depature: string;
}
export interface Event {
	[key: string]: string | number | EventHourRange;
	id: string;
	name: string;
	opening: string;
	price: string | number;
	status: string;
	tickets_quantity: number;
	tickets_sold: number;
	hour_range: EventHourRange;
}

export interface EventToCreate {
	[key: string]: string | number | EventHourRange | Date;
	name: string;
	opening: string | Date;
	closing: string | Date;
	price: string | number;
	status: string;
	tickets_quantity: number;
	tickets_sold: number;
	hour_range: EventHourRange;
	description: string
}
