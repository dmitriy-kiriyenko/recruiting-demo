class DashboardsController < ApplicationController
  def show
    @activities = PublicActivity::Activity.all
  end
end
