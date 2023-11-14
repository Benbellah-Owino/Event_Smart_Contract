export interface UserLoginType {
	identifier: string;
	password: string;
}

export interface UserRegisterType {
	[key: string]: string;
	email: string;
	password: string;
	wallet_address: string;
	username: string;
}
