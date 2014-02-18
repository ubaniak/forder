class GroupController < ApplicationController
    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        puts params[:name]
        if @group.save
            GroupMember.create!(:group => @group, :user => current_user, :confirmed => true)
            redirect_to root_path, :notice => "Created new group"
        else
            redirect_to root_path, :alert => "bang"
        end
    end

    def invite_member
        @group = Group.find(params[:id])
    end

    def add_member
        @user = User.find_by_email(params[:email])
        if not GroupMember.invited?(params[:group_id], @user.id)
            @group_member = GroupMember.create!(:user => @user, :group_id => params[:group_id])
            redirect_to root_path, :notice => "Invited user to group"
        else
            redirect_to root_path, :notice => "User already has an invite"
        end
    end

    def accept_invite
        GroupMember.confirm_invite(params[:group_id], params[:user_id])
        redirect_to root_path
    end

    def reject_invite
        GroupMember.reject_invite(params[:group_id], params[:user_id])
        redirect_to root_path
    end

    def group_params
        params.require(:group).permit(:name)
    end
end
