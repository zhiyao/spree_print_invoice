require 'prawn/layout'

font "Helvetica"
im = "#{Rails.root.to_s}/public/assets/#{Spree::PrintInvoice::Config[:print_invoice_logo_path]}"

image im, :at => [390,735], :scale => 0.5

fill_color "E99323"
if @hide_prices
  text I18n.t(:packaging_slip), :align => :left, :style => :bold, :size => 18
else
  text I18n.t(:customer_invoice), :align => :left, :style => :bold, :size => 18
end
fill_color "000000"
move_down 4

render :partial => "ship_to"

horizontal_rule

move_down 10

font "Helvetica",  :size => 9,  :style => :bold
text "#{I18n.t(:order_number)} ID: #{@order.number}", :align => :left

move_down 2
font "Helvetica", :size => 9
text "#{I18n.l @order.completed_at.to_date}", :align => :left


render :partial => "address"

move_down 30

render :partial => "line_items_box"

move_down 8

# Footer
render :partial => "footer"
