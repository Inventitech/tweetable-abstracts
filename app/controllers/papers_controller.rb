class PapersController < ApplicationController
  def new
    @paper = Paper.new
  end
  
  def create
    @paper = Paper.new(params.require(:paper).permit(:paperid, :secr, :abstract, :controverse1, :controverse2, :controverse3))
 
    if @paper.save
      render plain: params[:paper].inspect
    else
      render 'new'
    end
  end
end
