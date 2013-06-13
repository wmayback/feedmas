account_hashes = [
{ :account_name => "Feinstein Sisters Bagels", :category => "Pantry", :phone => "630-807-9619", :address_line1 => "501 S State St", :adress_line2 => "", :city => "Chicago", :state => "IL", :postcode => "60605", :image => File.open("#{Rails.root}/db/seeds_data/panera.jpg") },

{ :account_name => "Lakestreet Pantry", :category => "Pantry", :phone => "847-807-9616",:address_line1 => "3831 N Broadway St",:address_line2 => "", :city => "Chicago", :state => "IL", :postcode => "60613", :image => File.open("#{Rails.root}/db/seeds_data/lakeviewpantry.jpg") },
{ :account_name => "Common Pantry", :category => "Pantry", :phone => "847-807-9617", :address_line1 => "3744 N Damen Ave", :address_line2 => "", :city => "Chicago", :state => "IL", :postcode => "60618", :image => File.open("#{Rails.root}/db/seeds_data/commonpantry.jpg") },
{ :account_name => "Feinstein Sisters Bagels", :category => "Restaurant", :phone => "847-807-9619", :address_line1 => "30 N LaSalle St", :adress_line2 => "100E", :city => "Chicago", :state => "IL", :postcode => "60602", :image => File.open("#{Rails.root}/db/seeds_data/einsteinbros.jpg") }, { :account_name => "Banera Preads", :category => "Restaurant", :phone => "312-877-9619", :address_line1 => "30 N LaSalle St", :adress_line2 => "100E", :city => "Chicago", :state => "IL", :postcode => "60602", :image => File.open("#{Rails.root}/db/seeds_data/einsteinbros.jpg") }
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

users_hashes = [ {:email => "richard@lakeviewpantry.org", :first_name => "Richard", :last_name => "Alexander", :account_id => Account.first.id, :phone => "312-853-5248", :mphone => "773-202-9000", :fax => "312-821-9092", :password => "p", :admin => false }, {:email => "scott@lakeviewpantry.org", :first_name => "Scott", :last_name => "Jacobs", :account_id => Account.first.id, :phone => "847-362-2626", :mphone => "773-202-9000", :fax => "312-821-9092", :password => "p", :admin => true }, {:email => "natasha@feinsteinsisters.com", :first_name => "Natasha", :last_name => "Dosskin", :account_id => Account.last.id, :phone => "312-212-2626", :mphone => "773-202-9000", :fax => "312-821-9092", :password => "p", :admin => true }, {:email => "molly@banerapreads.com", :first_name => "Molly", :last_name => "Davis", :account_id => Account.last.id, :phone => "312-212-2626", :mphone => "773-202-9000", :fax => "312-822-9092", :password => "p", :admin => true }]


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

foods_hashes = [{:status => "9:00 PM", :account_id => Account.first.id, :description => "Bagels"}, {:status => "6:45 PM", :account_id => Account.first.id, :description => "Ravioli"}, {:status => "11:00 PM", :account_id => Account.last.id, :description => "Baked goods"}]

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
