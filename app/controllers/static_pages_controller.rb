class StaticPagesController < ApplicationController
  layout 'front', only: [:home]
  
  def home
  end
  
  def hire
  end

  def table
  end
end
