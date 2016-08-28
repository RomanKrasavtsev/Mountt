class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @records = current_user.family.record.all
  end
end
