   require "rails_helper"

RSpec.describe Search, :type => :model do
   
   
   it "should require a saved_search" do
  Search.new(:saved_search => "").should_not be_valid
end

it "should require a users_id" do
  Search.new(:users_id => "").should_not be_valid
end
it "should require a cname" do
  Search.new(:cname => "").should_not be_valid
end

it "should require a uname" do
  Search.new(:uname => "").should_not be_valid
end

    
end