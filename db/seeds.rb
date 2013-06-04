account_hashes = [
{ :account_name => "Olive Branch Mission", :category => "Pantry", :phone => "847-807-9616",:address_line1 => "6310 S Claremont Ave",:address_line2 => "Unit 1", :city => "Chicago", :state => "IL", :postcode => "60605", :image => File.open("#{Rails.root}/db/seeds_data/olivebranch.jpg") },
{ :account_name => "A Just Harvest", :category => "Pantry", :phone => "847-807-9617", :address_line1 => "7649 North Paulina", :address_line2 => "Unit 3", :city => "Chicago", :state => "IL", :postcode => "60606", :image => File.open("#{Rails.root}/db/seeds_data/olivebranch.jpg") },
{ :account_name => "Panera Bread", :category => "Restaurant", :phone => "847-807-9619", :address_line1 => "250 S. Wacker Dr.", :adress_line2 => "Unit 2", :city => "Chicago", :state => "IL", :postcode => "60603", :image => File.open("#{Rails.root}/db/seeds_data/olivebranch.jpg") }
]

Account.destroy_all
account_hashes.each do |account|
    a = Account.new
    a.account_name = account[:account_name]
    a.category = account[:category]
    a.phone = account[:phone]
    a.address_line1 = account[:address_line1]
    a.address_line2 = account[:address_line2]
    a.city = account[:city]
    a.state = account[:state]
    a.postcode = account[:postcode]
    a.image = account[:image]
    a.save

end
puts "There are now #{Account.count} rows in the Accounts table."

users_hashes = [ {:email => "test2", :first_name => "Chip", :last_name => "Buckets", :account_id => Account.first.id, :phone => "847-362-2626", :mphone => "773-202-9000", :fax => "312-821-9092", :password => "p", :admin => false }, {:email => "maduana3@gmail.com", :first_name => "Helga", :last_name => "Smith", :account_id => Account.first.id, :phone => "847-362-2626", :mphone => "773-202-9000", :fax => "312-821-9092", :password => "p", :admin => true }, {:email => "test", :first_name => "Bodega", :last_name => "Capstone", :account_id => Account.last.id, :phone => "312-212-2626", :mphone => "773-202-9000", :fax => "312-821-9092", :password => "p", :admin => true }]


User.destroy_all
users_hashes.each do |user|
    u = User.new
    u.email = user[:email]
    u.first_name = user[:first_name]
    u.last_name = user[:last_name]
    u.account_id = user[:account_id]
    u.phone = user[:phone]
    u.mphone = user[:mphone]
    u.fax = user[:fax]
    u.password = user[:password]
    u.admin = user[:admin]
    u.save

end
puts "There are now #{User.count} rows in the Users table."

foods_hashes = [{:status => "9:00 PM", :account_id => Account.last.account_name, :description => "Banana Bread"}, {:status => "6:45 PM", :account_id => Account.last.account_name, :description => "Ravioli"}, {:status => "11:00 PM", :account_id => Account.last.account_name, :description => "Tortilla Chips"}]

Food.destroy_all
foods_hashes.each do |food|
    f = Food.new
    f.status = food[:status]
    f.account_id = food[:account_id].to_i
    f.description = food[:description]
    f.save

end
puts "There are now #{Food.count} rows in the Foods table."



# id: integer, email: string, type: string, first_name: string, last_name: string, account_id: string, phone: string, mphone: string, fax: string, password_digest: string
