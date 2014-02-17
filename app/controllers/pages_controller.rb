class PagesController < ApplicationController
  def home
      if user_signed_in?
          @groups = current_user.my_groups
          @invits = current_user.my_invites
      end
  end
end
