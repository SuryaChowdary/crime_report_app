class PagesController < ApplicationController
  before_action :require_user, except: [:home]
  def home
  end
  def about
  end
end
