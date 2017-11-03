class SnacksController < ApplicationController
  def show
    @snack = Snack.find(params[:id])
    @machines = Machine.where(snack_id: params[:id])
  end
end
