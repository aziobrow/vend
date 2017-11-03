require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "they see the price of all the snacks of that machine" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: "White Castle Burger", price: 3.50)
    snack2 = dons.snacks.create(name: "Pop Rocks", price: 1.50)

    visit machine_path(dons)

    expect(page).to have_content("White Castle Burger")
    expect(page).to have_content("Pop Rocks")
    expect(page).to have_content("$3.50")
    expect(page).to have_content("$1.50")
  end
end
