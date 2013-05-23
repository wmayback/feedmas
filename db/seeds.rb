account_hashes = [
{ :account_name => "Olive Branch Mission", :phone => "847-807-9616",:address_line1 => "6310 S Claremont Ave",:address_line2 => "Unit 1", :city => "Chicago", :state => "IL", :postcode => "60605", :logo => "http://static.wix.com/media/d7240f_a9d4bb2eca2150a7191713abf4b9071c.jpg_srz_231_56_75_22_0.50_1.20_0.00_jpg_srz" },
{ :account_name => "A Just Harvest", :phone => "847-807-9617", :address_line1 => "7649 North Paulina", :adress_line2 => "Unit 3", :city => "Chicago", :state => "IL", :postcode => "60606", :logo => "http://commonpantry.org/wp-content/uploads/2011/07/common-pantry-logo-address.png" },
{ :account_name => "Panera Bread", :phone => "847-807-9619", :address_line1 => "250 S. Wacker Dr.", :adress_line2 => "Unit 2", :city => "Chicago", :state => "IL", :postcode => "60603", :logo => "http://www.panerabread.com/imagesNEW/logo.png" }
]

Account.destroy_all
account_hashes.each do |account|
    a = Account.new
    a.account_name = account[:account_name]
    a.phone = account[:phone]
    a.address_line1 = account[:address_line1]
    a.address_line2 = account[:address_line2]
    a.city = account[:city]
    a.state = account[:state]
    a.postcode = account[:postcode]
    a.logo = account[:logo]
    a.save

end
puts "There are now #{Account.count} rows in the Accounts table."

users_hashes = [
{:email => "maduana3@gmail.com", :type => "pantry", :first_name => "Helga", :last_name => "Smith", :account_id => 0, :phone => "847-362-2626", :mphone => "773-202-9000", :fax => "312-821-9092" },
{:email => "delamikeii@hotmail.com", :type => "restaurant", :first_name => "Jimmy", :last_name => "Donohugh", :account_id => 1, :phone => "847-362-7560", :mphone => "847-909-5050", :fax => "312-821-9093" },
{:email => "heytherelilmomma@aol.com", :type => "pantry", :first_name => "Johnny", :last_name => "Bravo", :account_id => 1, :phone => "847-707-1200", :mphone => "773-191-9090", :fax => "312-821-7773" },
{:email => "xxxpinoyboi3xxx@hotmail.com", :type => "restaurant", :first_name => "BillNye", :last_name => "TheScienceGuy", :account_id => 2, :phone => "800-suckadick", :mphone => "696-969-6969", :fax => "ballsballsballs" },
]

User.destroy_all
users_hashes.each do |users|
    u = User.new
    u.email = users[:email]
    u.first_name = users[:first_name]
    u.last_name = users[:last_name]
    u.account_id = users[:account_id]
    u.phone = users[:phone]
    u.mphone = users[:mphone]
    u.fax = users[:fax]
    u.save

end
puts "There are now #{User.count} rows in the Accounts table."



