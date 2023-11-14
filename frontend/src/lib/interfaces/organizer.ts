export interface Socials {
	[key: string]: string;
	twitter: string;
	instagram: string;
	facebook: string;
}
export interface OrganizerRegisterType {
	[key: string]: string | string[] | Socials;
	email: string;
	password: string;
	wallet_address: string;
	username: string;
	phone: string[];
	socials: Socials;
}
