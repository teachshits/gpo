# encoding: utf-8

class ChairsController < ApplicationController

  layout 'public'

  def index
    @chairs = Chair.ordered_by_faculty.group_by(&:faculty)
  end

end
