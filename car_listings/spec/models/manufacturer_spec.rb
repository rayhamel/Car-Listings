require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  it { should have_many(:cars) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :country }

  it { should have_valid(:name).when('Toyota') }
  it { should have_valid(:country).when('Japan') }

  it { should_not have_valid(:name).when(nil) }
  it { should_not have_valid(:country).when(nil) }
end
