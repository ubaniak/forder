require 'spec_helper'

describe "Create a group" do
    it "should create a group" do
        group = Group.new :name => "durr"
        expect(group.name).to eq('durr')
    end

    it "should save to the db" do
        Group.create! :name => "durr"
        expect(Group.find_by_name("durr").name).to eq("durr")
    end
end
