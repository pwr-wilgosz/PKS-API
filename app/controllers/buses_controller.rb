class BusesController < ApplicationController
  def index
    respond_with Bus.all
  end
end

