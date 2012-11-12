ship_address = @order.ship_address

fill_color "000000"
font "Helvetica", :size => 9
text "#{I18n.t(:ship_to)}:", :align => :left

font "Helvetica", :size => 12, :style => :bold
text "#{ship_address.firstname} #{ship_address.lastname}"
text "#{ship_address.address1} #{ship_address.address2}"
text "#{ship_address.city} #{ship_address.zipcode} #{ship_address.country.name}"