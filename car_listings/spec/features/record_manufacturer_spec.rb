require 'rails_helper'

feature %(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
) do
  let(:test_manufacturer) { FactoryGirl.create(:manufacturer) }

  scenario 'correctly creates manufacturer' do
    visit new_manufacturer_path
    expect(page).to_not have_content(test_manufacturer.name)

    fill_in 'Name', with: 'Mercedes-Benz'
    fill_in 'Country', with: 'Germany'

    click_button 'Create Manufacturer'

    expect(page).to have_content('Mercedes-Benz')
    expect(page).to have_content(test_manufacturer.name)
  end

  scenario "doesn't specify name/country" do
    visit new_manufacturer_path

    click_button 'Create Manufacturer'

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Country can't be blank")
  end
end
