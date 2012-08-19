class HomeController < ApplicationController
  before_filter :authenticate_user!
  layout "store"
  def index
  end
end
