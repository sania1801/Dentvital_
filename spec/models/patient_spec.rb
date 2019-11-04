require 'rails_helper'

RSpec.describe Patient, type: :model do

	it "should require name" do
		@patient = Patient.new
		@patient.name = "vasia"
		@patient.should_not be_valid
		@patient.errors.on(:name).should_not be_nil
	end	

end
