interface EventHourRange {
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
