# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Account.create({
	name:"User 01",
	cpf: "000001",
	email:"user01@email.com",
	password:"user01",
	password_confirmation:"user01",
	account_balance: 0
})

Account.create({
	name:"User 02",
	cpf: "000002",
	email:"user02@email.com",
	password:"user02",
	password_confirmation:"user02",
	account_balance: 200.00
})

Account.create({
	name:"User 03",
	cpf: "000003",
	email:"user03@email.com",
	password:"user03",
	password_confirmation:"user03",
	account_balance: 4000.00
})

Account.create({
	name:"User 04",
	cpf: "000004",
	email:"user04@email.com",
	password:"user04",
	password_confirmation:"user04",
	account_balance: 900.00
})

Operation.create({source_account_id:1,destination_account_id:2, amount:20,option: "transfer"})
Operation.create({source_account_id:3,destination_account_id:1,amount:10,option: "transfer"})
Operation.create({source_account_id:1,destination_account_id:2,amount:30, option: "transfer"})
Operation.create({source_account_id:7,destination_account_id:2,amount:30, option: "transfer"})