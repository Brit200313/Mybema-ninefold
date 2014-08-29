class HomeController < ApplicationController
  def index
    @discussions = Discussion.with_includes.visible.by_recency.limit(8)
  end
end