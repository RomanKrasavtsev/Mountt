class DashboardController < ApplicationController
  def index
    @family = Family.find(1)
    @user = @family.user.find(1)
    @records = @family.record.all
  end
end
