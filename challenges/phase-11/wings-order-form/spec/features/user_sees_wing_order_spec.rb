require "rails_helper"

feature "user views wing orders" do
  let(:honey_bbq_flavor) { Flavor.create(name: "Honey BBQ") }
  let(:sweet_chili_flavor) { Flavor.create(name: "Sweet Chili") }
  let(:wing_order) do
    WingOrder.create(
      customer_name: "Gene Parmesean",
      city: "Boston",
      state: "MA",
      quantity: 100,
      ranch_dressing: true
    )
  end
  let!(:order_first_flavor) { OrderFlavor.create(wing_order: wing_order, flavor: honey_bbq_flavor) }
  let!(:order_second_flavor) { OrderFlavor.create(wing_order: wing_order, flavor: sweet_chili_flavor) }

  scenario "see all orders" do
    visit wing_orders_path

    expect(page).to have_content("Gene Parmesean")
    expect(page).to have_content("Boston")
    expect(page).to have_content("MA")
    expect(page).to have_content("100")
    expect(page).to have_content("Ranch")
    expect(page).to have_content("Honey BBQ")
    expect(page).to have_content("Sweet Chili")
  end
end
