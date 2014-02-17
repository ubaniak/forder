class PagesController < ApplicationController
  def home
      if user_signed_in?
          @groups = current_user.my_groups
      end
  end
end
