require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  # before(:each) do
  #   assign(:orders, [
  #     Order.create!(
  #       :diagnose => "Diagnose",
  #       :age => 2,
  #       :total => 3.5
  #     ),
  #     Order.create!(
  #       :diagnose => "Diagnose",
  #       :age => 2,
  #       :total => 3.5
  #     )
  #   ])
  # end

  # it "renders a list of orders" do
  #   render
  #   assert_select "tr>td", :text => "Diagnose".to_s, :count => 2
  #   assert_select "tr>td", :text => 2.to_s, :count => 2
  #   assert_select "tr>td", :text => 3.5.to_s, :count => 2
  # end
end
