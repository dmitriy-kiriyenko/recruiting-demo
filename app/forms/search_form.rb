class SearchForm
  include ActiveAttr::Model

  attribute :labels

  def all_tags
    @_all_tags = ActsAsTaggableOn::Tag.all
  end
end
