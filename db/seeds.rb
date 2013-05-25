account_hashes = [
{ :account_name => "Olive Branch Mission", :phone => "847-807-9616",:address_line1 => "6310 S Claremont Ave",:address_line2 => "Unit 1", :city => "Chicago", :state => "IL", :postcode => "60605", :logo => "http://static.wix.com/media/d7240f_a9d4bb2eca2150a7191713abf4b9071c.jpg_srz_231_56_75_22_0.50_1.20_0.00_jpg_srz" },
{ :account_name => "A Just Harvest", :phone => "847-807-9617", :address_line1 => "7649 North Paulina", :address_line2 => "Unit 3", :city => "Chicago", :state => "IL", :postcode => "60606", :logo => "http://commonpantry.org/wp-content/uploads/2011/07/common-pantry-logo-address.png" },
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
{:email => "maduana3@gmail.com", :first_name => "Helga", :last_name => "Smith", :account_id => Account.first.id, :phone => "847-362-2626", :mphone => "773-202-9000", :fax => "312-821-9092", :password => "p", :admin => false }, {:email => "test", :first_name => "Bodega", :last_name => "Capstone", :account_id => Account.last.id, :phone => "312-212-2626", :mphone => "773-202-9000", :fax => "312-821-9092", :password => "p", :admin => false }]


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

# id: integer, email: string, type: string, first_name: string, last_name: string, account_id: string, phone: string, mphone: string, fax: string, password_digest: string
