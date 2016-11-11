class ImageSearchesController < ApplicationController
  def show
    @search = SearchForm.new labels: search_labels
    @images = current_user.images.tagged_with(@search.labels, on: :labels, any: true) if search_labels
  end

  private

  def search_labels
    params[:search_form] && params[:search_form][:labels]
  end
end
