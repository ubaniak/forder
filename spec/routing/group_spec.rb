require 'spec_helper'
require 'capybara/rspec'

describe "Groups page" do
    it "should open the groups page" do
        visit root_path
    end
end
