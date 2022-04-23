class AdminsController < ApplicationController
  # before_action :logged_in,only: [:top]
  def top
    @event = Event.new
  end
end
