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
    @categories = categories.map { |k, v| { key: k , value: v }}

    # Users
    users = current_user.family.record
      .current_month
      .select("users.firstname", "items.value")
      .joins(:item)
      .group("users.firstname")
      .order("sum_records_value DESC")
      .sum("records.value")
    @users = users.map { |k, v| { key: k, value: v }}

    # Costs
    costs = current_user.family.record
      .current_month
      .select(:value, :date)
      .group(:date)
      .order("date")
      .sum("value")

    month = []
    now = Time.now
    Time.days_in_month(now.month, now.year).times do |i|
      month << "#{now.year}-#{now.month}-#{i}"
    end
    @costs = costs.map { |k, v| { key: k, value: v }}
  end
end
