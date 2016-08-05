require "rails_helper"

RSpec.describe Higher, :type => :model do
    
    it "should require a higher" do
  Higher.new(:higher => "").should_not be_valid
end
it "should require a code_letter" do
  Higher.new(:code_letter => "").should_not be_valid
end

end