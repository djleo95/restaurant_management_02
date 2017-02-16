class TablesController < ApplicationController
  def index
    if params[:table]
      from = params[:table][:day] + " " + params[:table][:from]
      to = params[:table][:day] + " " + params[:table][:to]
      @tables = Table.free params[:table][:capacity], from, to
    end
  end
end
