class GroupController < ApplicationController
    def new
        @group = Group.new
    end

    def create
        @group = Group.new :name => params[:name]
        if @group.save
            redirect_to root_path, :notice => "Created new group"
        else
            redirect_to root_path, :alert => "bang"
        end
    end
end
