require 'rails_helper'

feature %(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
) do
  let(:test_car) { FactoryGirl.create(:car) }

  before(:each) do
    test_car.save
  end

  scenario 'correctly creates car' do
    visit new_car_path
    expect(page).to_not have_content(test_car.color)

    select (test_car.manufacturer.name), from: "Manufacturer"
    fill_in 'Color', with: 'Red'
    fill_in 'Mileage', with: '50000'
    select '2007', from: 'Year'
    fill_in 'Description', with: 'Amazeballs!'

    click_button 'Create Car'

    expect(page).to have_content(test_car.color)
    expect(page).to have_content('Red')
  end

  scenario 'description is optional' do
    visit new_car_path

    select (test_car.manufacturer.name), from: "Manufacturer"
    fill_in 'Color', with: 'Black'
    fill_in 'Mileage', with: '50000'
    select '2009', from: 'Year'

    click_button 'Create Car'

    expect(page).to have_content(test_car.color)
    expect(page).to have_content('Black')
  end

  scenario "doesn't specify required fields" do
    visit new_car_path

    click_button 'Create Car'

    expect(page).to have_content("Manufacturer can't be blank")
    expect(page).to have_content("Color can't be blank")
    expect(page).to have_content("Mileage can't be blank")
    expect(page).to have_content("Year can't be blank")
  end

  scenario 'not possible to select years before 1920' do
    visit new_car_path

    expect(page).to have_select('Manufacturer')
    expect(page).to_not have_select('Manufacturer', options: ['1919'])
  end
end
