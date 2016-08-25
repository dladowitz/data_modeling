require 'rails_helper'

describe OrdersController do
  let(:author) { Author.create(name: FFaker::Name.first_name) }
  let(:book) { author.books.create(title: FFaker::Skill.tech_skill) }
  let(:video) { Video.create(name:FFaker::Name.first_name, length: 102) }

  describe "#index" do
    subject { get :index }

    before do
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

  describe "#create" do
    subject { post :create,  order: { shipping_address: "1000 Main St", line_items: [{ purchasable_type: "book", purchasable_id: book.id, item_price: 999, quantity: 2 }, { purchasable_type: "video", purchasable_id: video.id, item_price: 1000, quantity: 1 }] }}
    before { subject }

    it { should redirect_to orders_path }

    it "creates a new order in the database" do
      expect(Order.first.shipping_address).to eq "1000 Main St"
    end

    it "should set a shipping date" do
      expect(Order.first.shipping_date).to be_within(1.hour).of(2.days.from_now)
    end

    it "creates new line items in the database" do
      expect(LineItem.count).to eq 2
    end

    it "associates the line items with the order" do
      expect(LineItem.first.order.shipping_address).to eq "1000 Main St"
    end
  end
end
