class PagesController < ApplicationController
  def home
      if user_signed_in?
          @groups = current_user.my_groups
          @invits = current_user.my_invites
          @events = current_user.my_events
      end
      @places = Place.all
  end
end
