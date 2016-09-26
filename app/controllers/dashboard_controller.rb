class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # Categories
    categories = current_user.family.record
      .current_month
      .select("records.name", "items.value")
      .joins(:item)
      .group("items.name")
      .order("sum_records_value DESC")
      .sum("records.value")
    @categories = categories.map { |k, v| { name: k , value: v }}

    # Users
    users = current_user.family.record
      .current_month
      .select("users.firstname", "items.value")
      .joins(:item)
      .group("users.firstname")
      .order("sum_records_value DESC")
      .sum("records.value")
    @users = users.map { |k, v| { name: k, value: v }}

    # Costs
    costs = current_user.family.record
      .current_month
      .select(:value, :date)
      .group(:date)
      .order("date")
      .sum("value")
    @costs = costs.map { |k, v| { date: k, value: v }}
  end
end
