class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Records
    records = current_user.family.record
      .current_month
      .select("records.name", "items.value")
      .joins(:item)
      .group("items.name")
      .order("sum_records_value DESC")
      .sum("records.value")
    @records = records.map { |k, v| { name: k , value: v } }

    # Users
    users = current_user.family.record
      .current_month
      .select("users.firstname", "items.value")
      .joins(:item)
      .group("users.firstname")
      .order("sum_records_value DESC")
      .sum("records.value")
    @users = users.map { |k, v| { user: k, amount: v } }
  end
end
