class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @family = Family.find(1)
    @user = @family.user.find(1)
    @records = @family.record.all
  end
end
