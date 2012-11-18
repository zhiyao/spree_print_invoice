require 'prawn/layout'

font "Helvetica"
im = "#{Rails.root.to_s}/public/assets/#{Spree::PrintInvoice::Config[:print_invoice_logo_path]}"

fill_color "E99323"
if @hide_prices
  text I18n.t(:packaging_slip), :align => :left, :style => :bold, :size => 18
else
  text I18n.t(:customer_invoice), :align => :left, :style => :bold, :size => 18
end


fill_color "000000"
move_down 4
render :partial => "ship_to"

font "Helvetica",  :size => 9
text "#{I18n.t(:order_number)} ID: #{@order.number}", :align => :left
text "#{I18n.t(:order_date)}: #{I18n.l @order.completed_at.to_date}", :align => :left

render :partial => "address"

move_down 20

render :partial => "line_items_box"

move_down 30

#image and company info
image im, :at => [410,735], :scale => 0.5
font "Helvetica", :size => 8
bounding_box([410, 695], :width => 300, :height => 200) do
  text "Two Bugs Sdn Bhd (1018561-T)"
  text "Suite 731, 7th floor, Block A2"
  text "Leisure Commerce Square"
  text "9 Jalan PJS 8/9"
  text "46150 Petaling Jaya"
  text "Selangor D.E., Malaysia"
end


bounding_box([0,150], :width => 540, :height => 200) do
  stroke do
    dash 4
    horizontal_rule
  end

  move_down 10
  fill_color "E99323"
  text "Return Slip", :align => :left, :style => :bold, :size => 18
  move_up 25
  fill_color "000000"
  text "#{I18n.t(:order_number)} ID: #{@order.number}", :align => :right, :size => 9

  bounding_box([20,160], :width => 500, :height => 80, :padding => 20) do
    undash
    draw_text "Reason:", :at => [5,70], :size => 9
    stroke_bounds
  end

  move_down 10
  text "Return Address:"
  text "  Two Bugs Sdn Bhd"
  text "  21 Jalan SS2/64"
  text "  Petaling Jaya, Selangor"
  text "  47300 Malaysia"

  move_up 9
  text "Customer Support: support@tenbugs.com", :align => :right

  move_up 9
  text "All Terms and Condition apply", :align => :center


end
# Footer
render :partial => "footer"
