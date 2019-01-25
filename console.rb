require('pry')
require_relative('./models/Customer.rb')
require_relative('./models/Film.rb')
require_relative('./models/Ticket.rb')
require_relative('./models/Screening.rb')

#empty database tables
Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

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
  customer0 = Customer.new('name' => customer_name0, 'funds' => 100.0)
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

  #create 3 screenings per movie(just assume we have 8 screens!)
  screening0a = Screening.new({'film_id' => film0.id, 'screening' => '16:00', 'seats' => 20})
  screening0b = Screening.new({'film_id' => film0.id, 'screening' => '17:00', 'seats' => 20})
  screening0c = Screening.new({'film_id' => film0.id, 'screening' => '23:00', 'seats' => 20})
  screening1a = Screening.new({'film_id' => film1.id, 'screening' => '16:00', 'seats' => 20})
  screening1b = Screening.new({'film_id' => film1.id, 'screening' => '17:00', 'seats' => 20})
  screening1c = Screening.new({'film_id' => film1.id, 'screening' => '23:00', 'seats' => 20})
  screening2a = Screening.new({'film_id' => film2.id, 'screening' => '16:00', 'seats' => 20})
  screening2b = Screening.new({'film_id' => film2.id, 'screening' => '17:00', 'seats' => 20})
  screening2c = Screening.new({'film_id' => film2.id, 'screening' => '23:00', 'seats' => 20})
  screening3a = Screening.new({'film_id' => film3.id, 'screening' => '16:00', 'seats' => 20})
  screening3b = Screening.new({'film_id' => film3.id, 'screening' => '17:00', 'seats' => 20})
  screening3c = Screening.new({'film_id' => film3.id, 'screening' => '23:00', 'seats' => 20})
  screening4a = Screening.new({'film_id' => film4.id, 'screening' => '16:00', 'seats' => 20})
  screening4b = Screening.new({'film_id' => film4.id, 'screening' => '17:00', 'seats' => 20})
  screening4c = Screening.new({'film_id' => film4.id, 'screening' => '23:00', 'seats' => 20})
  screening5a = Screening.new({'film_id' => film5.id, 'screening' => '16:00', 'seats' => 20})
  screening5b = Screening.new({'film_id' => film5.id, 'screening' => '17:00', 'seats' => 20})
  screening5c = Screening.new({'film_id' => film5.id, 'screening' => '23:00', 'seats' => 20})
  screening6a = Screening.new({'film_id' => film6.id, 'screening' => '16:00', 'seats' => 20})
  screening6b = Screening.new({'film_id' => film6.id, 'screening' => '17:00', 'seats' => 20})
  screening6c = Screening.new({'film_id' => film6.id, 'screening' => '23:00', 'seats' => 20})
  screening7a = Screening.new({'film_id' => film7.id, 'screening' => '16:00', 'seats' => 20})
  screening7b = Screening.new({'film_id' => film7.id, 'screening' => '17:00', 'seats' => 20})
  screening7c = Screening.new({'film_id' => film7.id, 'screening' => '23:00', 'seats' => 20})
  screenings=[
    screening0a,    screening0b,    screening0c,
    screening1a,    screening1b,    screening1c,
    screening2a,    screening2b,    screening2c,
    screening3a,    screening3b,    screening3c,
    screening4a,    screening4b,    screening4c,
    screening5a,    screening5b,    screening5c,
    screening6a,    screening6b,    screening6c,
    screening7a,    screening7b,    screening7c,
  ]
  screenings.each {|s| s.save}

  #create some tickets v1
  # ticket0 = Ticket.new({'customer_id' => customer0.id, 'film_id' => film0.id})
  # ticket1 = Ticket.new({'customer_id' => customer0.id, 'film_id' => film1.id})
  # ticket2 = Ticket.new({'customer_id' => customer0.id, 'film_id' => film2.id})
  # ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
  # ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
  # ticket5 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
  # ticket6 = Ticket.new({'customer_id' => customer3.id, 'film_id' => film1.id})
  #
  #create some tickets v2
  # ticket0 = customer0.buy_ticket(film0)
  # ticket1 = customer0.buy_ticket(film1)
  # ticket2 = customer0.buy_ticket(film2)
  # ticket3 = customer1.buy_ticket(film1)
  # ticket4 = customer2.buy_ticket(film1)
  # ticket5 = customer2.buy_ticket(film2)
  # ticket6 = customer3.buy_ticket(film1)
  # ticket7 = customer3.buy_ticket(film3)

  #create some tickets v3
  ticket0 = customer0.buy_ticket(screening0a)
  ticket1 = customer0.buy_ticket(screening1b)
  ticket2 = customer0.buy_ticket(screening2c)
  ticket3 = customer1.buy_ticket(screening0a)
  ticket4 = customer1.buy_ticket(screening1b)
  ticket5 = customer1.buy_ticket(screening2c)
  ticket6 = customer2.buy_ticket(screening0a)
  ticket7 = customer2.buy_ticket(screening1b)
  ticket8 = customer2.buy_ticket(screening1c)
  ticket9 = customer3.buy_ticket(screening0a)
  ticket10 = customer3.buy_ticket(screening1b)
  ticket11 = customer3.buy_ticket(screening2c)
  ticket12 = customer4.buy_ticket(screening0a)
  ticket13 = customer4.buy_ticket(screening1b)
  ticket14 = customer4.buy_ticket(screening2c)
  ticket15 = customer5.buy_ticket(screening4a)
  ticket16 = customer5.buy_ticket(screening5b)
  ticket17 = customer5.buy_ticket(screening6c)
  ticket18 = customer6.buy_ticket(screening6a)
  ticket19 = customer6.buy_ticket(screening7b)
  ticket20 = customer6.buy_ticket(screening7c)
  ticket21 = customer7.buy_ticket(screening0a)
  ticket22 = customer7.buy_ticket(screening1b)
  ticket23 = customer7.buy_ticket(screening2c)

end

#show all film screenings
film_screenings = Screening.get_all_film_screenings

#Show how popular movies are
all_ticket_sales = Ticket.show_ticket_sales

#max out ticket sales for first film
begin
  ticket24 = customer0.buy_ticket(screening0a)
  ticket25 = customer0.buy_ticket(screening0a)
  ticket26 = customer0.buy_ticket(screening0a)
  ticket27 = customer0.buy_ticket(screening0a)
  ticket28 = customer0.buy_ticket(screening0a)
  ticket29 = customer0.buy_ticket(screening0a)
  ticket30 = customer0.buy_ticket(screening0a)
  ticket31 = customer0.buy_ticket(screening0a)
  ticket32 = customer0.buy_ticket(screening0a)
  ticket33 = customer0.buy_ticket(screening0a)
  ticket34 = customer0.buy_ticket(screening0a)
  ticket35 = customer0.buy_ticket(screening0a)
  ticket36 = customer0.buy_ticket(screening0a)
  ticket37 = customer0.buy_ticket(screening0a)

end

# these two should nil as no seats free:
# (ran out of money first and had to give her more cash!
#  which proved the lack of funds check!)
ticket38 = customer0.buy_ticket(screening0a)
ticket39 = customer0.buy_ticket(screening0a)

binding.pry
nil
