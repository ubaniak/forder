class GroupController < ApplicationController
    def new
    end

    def create
        puts params
        redirect_to root_path
    end
end
