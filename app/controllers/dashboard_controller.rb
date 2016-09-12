class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    records = current_user.family.record
      .current_month
      .select("records.name", "items.value")
      .joins(:item)
      .group("items.name")
      .order("items_name")
      .sum("records.value")

    @dataset = records.map { |k, v| { name: k , value: v } }
  end
end
