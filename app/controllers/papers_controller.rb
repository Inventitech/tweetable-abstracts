require 'securerandom'

class PapersController < ApplicationController
  def new
    @paper = Paper.new
  end

  def edit
    @paper = Paper.find(params[:id])
  end
  
  def create
    @paper = Paper.new(insert_params)
    @paper.secr = SecureRandom.hex[0, 8]
 
    if @paper.save
      render plain: params[:paper].inspect + " secr: " + @paper.secr.inspect
    else
      render 'new'
    end
  end

  private
    def insert_params
      params.require(:paper).permit(:paperid, :secr, :abstract, :controverse1, :controverse2, :controverse3)
    end
end
