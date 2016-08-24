require 'rails_helper'

describe OrdersController do
  describe "#index" do
    subject { get :index }
    before do
      author = Author.create(name: FFaker::Name.first_name)
      book = author.books.create(title: FFaker::Skill.tech_skill)

      2.times do
         order = Order.create shipping_address: "12345 Main St", shipping_date: 1.week.from_now
         order.line_items.create(purchasable_type: "book", purchasable_id: book.id, item_price: 999, quantity: 2)
       end
      subject
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end

    it "finds all the orders in the database" do
      expect(assigns(:orders).count).to eq 2
    end
  end
end
