require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should belong_to :manufacturer }

  it { should validate_presence_of :manufacturer }
  it { should validate_presence_of :color }
  it { should validate_presence_of :mileage }
  it { should validate_presence_of :year }

  it { should validate_numericality_of :mileage }
  it { should validate_numericality_of :year }

  it { should have_valid(:color).when('Red') }
  it { should have_valid(:mileage).when(50000) }
  it { should have_valid(:year).when(2003) }
  it {
    should have_valid(:manufacturer).when(FactoryGirl.create(:manufacturer))
  }

  it { should_not have_valid(:color).when(nil) }
  it { should_not have_valid(:manufacturer).when(nil) }
  it { should_not have_valid(:mileage).when(nil) }
  it { should_not have_valid(:mileage).when('Low miles!') }
  it { should_not have_valid(:mileage).when(10000.5) }
  it { should_not have_valid(:year).when(nil) }
  it { should_not have_valid(:year).when('Fresh off the lot!') }
  it { should_not have_valid(:year).when(1964.5) }
  it { should_not have_valid(:year).when(1919) }
end
