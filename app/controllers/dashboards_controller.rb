class DashboardsController < ApplicationController
  def show
    @activities = PublicActivity::Activity.all.order('id desc')
  end
end
