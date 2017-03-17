User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

def arbitrary_pass(size)
	[*('A'..'Z'),*('0'..'9')].sample(size).join
end

def arbitrary_txt(size)
	[*('a'..'z')].sample(size).join
end

next_year = Date.today+1.year

db_populate = [
	{first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female"},
	{first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male"},
	{first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male"},
	{first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female"}
]

db_populate.each {|usr|
	User.create! [
		{username: usr[:last_name], password_digest: arbitrary_pass(10)}
	]
	usri = User.find_by username: usr[:last_name]
	usri.create_profile gender: usr[:gender], birth_year: usr[:birth_year], first_name: usr[:first_name], last_name: usr[:last_name]

	TodoList.create! [
		{list_name: "list of #{usr[:last_name]}", list_due_date: next_year}
	]
	listi = TodoList.find_by list_name: "list of #{usr[:last_name]}"
	for i in 0...5
		itemi = TodoItem.create! [
			{due_date: next_year, title: "Title "+arbitrary_txt(5), description: "Description "+arbitrary_txt(6)+" "+arbitrary_txt(5), completed: false}
		]
		listi.todo_items << itemi
	end
	usri.todo_lists << listi
}
