require "rails_helper"

RSpec.describe Degree, :type => :model do

it "should require a cname" do
  Degree.new(:cname => "").should_not be_valid
end

it "should require a uname" do
  Degree.new(:uname => "").should_not be_valid
end

it "should require a ucas" do
  Degree.new(:ucas => "").should_not be_valid
end

it "should require a duration" do
  Degree.new(:duration => "").should_not be_valid
end

it "should require a qualification" do
  Degree.new(:cname => "").should_not be_valid
end

it "should require a entry" do
  Degree.new(:entry => "").should_not be_valid
end

it "should require a url" do
  Degree.new(:url => "").should_not be_valid
end

end