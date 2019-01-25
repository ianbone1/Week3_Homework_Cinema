require('pry')
require_relative('./models/Customer.rb')
require_relative('./models/Film.rb')
require_relative('./models/Ticket.rb')

#empty database tables
Film.delete_all()
Customer.delete_all()
Ticket.delete_all()

#test creating a customer and a film
customer1 = Customer.new('name' => 'Ian Bone', 'funds' => 50.00000001)
film1 = Film.new('title' => 'Harry Potter 1', 'price' => 4.95)

#save them to the DB
customer1.save
film1.save

#update film price and wallet
film1.price = 4.99
film1.update()
customer1.funds = 50.10
customer1.update()

#delete my customer and film
customer1.delete
film1.delete

# Seed Database
begin
  customer_name0 = "Delia"
  customer_name1 = "Kim"
  customer_name2 = "Neil"
  customer_name3 = "James"
  customer_name4 = "Ian"
  customer_name5 = "Eloise"
  customer_name6 = "Heather"
  customer_name7 = "Robert"
  customer_name8 = "Stuart"
  customer_name9 = "Collin"
  customer_name10 = "Carme"
  customer_name11 = "John"
  customer_name12 = "Kyle"
  customer_name13 = "Ewan"
  customer_name14 = "Simon"
  customer0 = Customer.new('name' => customer_name0, 'funds' => 50.0)
  customer1 = Customer.new('name' => customer_name1, 'funds' => 50.0)
  customer2 = Customer.new('name' => customer_name2, 'funds' => 50.0)
  customer3 = Customer.new('name' => customer_name3, 'funds' => 50.0)
  customer4 = Customer.new('name' => customer_name4, 'funds' => 50.0)
  customer5 = Customer.new('name' => customer_name5, 'funds' => 50.0)
  customer6 = Customer.new('name' => customer_name6, 'funds' => 50.0)
  customer7 = Customer.new('name' => customer_name7, 'funds' => 50.0)
  customer8 = Customer.new('name' => customer_name8, 'funds' => 50.0)
  customer9 = Customer.new('name' => customer_name9, 'funds' => 50.0)
  customer10 = Customer.new('name' => customer_name10, 'funds' => 50.0)
  customer11 = Customer.new('name' => customer_name11, 'funds' => 50.0)
  customer12 = Customer.new('name' => customer_name12, 'funds' => 50.0)
  customer13 = Customer.new('name' => customer_name13, 'funds' => 50.0)
  customer14 = Customer.new('name' => customer_name14, 'funds' => 50.0)
  customer0.save()
  customer1.save()
  customer2.save()
  customer3.save()
  customer4.save()
  customer5.save()
  customer6.save()
  customer7.save()
  customer8.save()
  customer9.save()
  customer10.save()
  customer11.save()
  customer12.save()
  customer13.save()
  customer14.save()

  # create films
  film_name0 = "Harry Potter and the Philosopher's Stone"
  film_name1 = "Harry Potter and the Chamber of Secrets"
  film_name2 = "Harry Potter and the Prisoner of Azkaban"
  film_name3 = "Harry Potter and the Goblet of Fire"
  film_name4 = "Harry Potter and the Order of The Pheonix"
  film_name5 = "Harry Potter and the Half Blood Prince"
  film_name6 = "Harry Potter and the Deathly Hallows Part 1"
  film_name7 = "Harry Potter and the Deathly Hallows Part 2"
  film0 = Film.new('title' => film_name0, 'price' => 4.95)
  film1 = Film.new('title' => film_name1, 'price' => 4.95)
  film2 = Film.new('title' => film_name2, 'price' => 4.95)
  film3 = Film.new('title' => film_name3, 'price' => 4.95)
  film4 = Film.new('title' => film_name4, 'price' => 4.95)
  film5 = Film.new('title' => film_name5, 'price' => 4.95)
  film6 = Film.new('title' => film_name6, 'price' => 4.95)
  film7 = Film.new('title' => film_name7, 'price' => 4.95)
  film0.save()
  film1.save()
  film2.save()
  film3.save()
  film4.save()
  film5.save()
  film6.save()
  film7.save()

  #create some tickets
  # ticket0 = Ticket.new({'customer_id' => customer0.id, 'film_id' => film0.id})
  # ticket1 = Ticket.new({'customer_id' => customer0.id, 'film_id' => film1.id})
  # ticket2 = Ticket.new({'customer_id' => customer0.id, 'film_id' => film2.id})
  # ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
  # ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
  # ticket5 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
  # ticket6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})

  ticket0 = customer0.buy_ticket(film0)
  ticket1 = customer0.buy_ticket(film1)
  ticket2 = customer0.buy_ticket(film2)
  ticket3 = customer1.buy_ticket(film1)
  ticket4 = customer2.buy_ticket(film1)
  ticket5 = customer2.buy_ticket(film2)
  ticket6 = customer3.buy_ticket(film1)
  ticket7 = customer3.buy_ticket(film3)

  #
  #
  # ticket0.save
  # ticket1.save
  # ticket2.save
  # ticket3.save
  # ticket4.save
  # ticket5.save
  # ticket6.save
  # ticket6.save

end

# customer0.films
# film0.customers


binding.pry
nil
