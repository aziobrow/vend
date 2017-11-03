require 'rails_helper'

feature "when a user visits a snack show page" do
  before do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    bluths = owner.machines.create(location: "Bluth's Banana Stand")
    snack1 = Snack.create(name: "Frozen Banana", price: 5.00, machine: dons)
    snack2 = Snack.create(name: "Frozen Banana", price: 5.00, machine: bluths)
    visit snack_path(snack1)
  end

  scenario "they see details about the snack" do
    expect(page).to have_content("Frozen Banana")
    expect(page).to have_content("$5.00")
  end

  scenario "they see a list of locations for vending machines with this snack" do
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Bluth's Banana Stand")
  end

  scenario "they see the average price for snacks in those vending machines" do
    snack3 = Snack.create(name: "Cheetos", price: 3.00, machine: dons)
  end

  scenario "they see a count of the different kinds of items in that vending machine" do

  end
end
