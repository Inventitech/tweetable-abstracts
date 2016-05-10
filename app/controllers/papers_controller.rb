require 'securerandom'
require 'digest/sha1'

class PapersController < ApplicationController
  def new
    @paper = Paper.new
  end

  def edit
    check_secr params[:secr]
  end

  def secr
    params[:secr]
  end
  helper_method :secr

  def update
    if check_secr params[:secr]
      if @paper.update(insert_params)
        render plain: "Changes saved!"
      else
        render 'edit'
      end
    end
  end
  
  def create
    @paper = Paper.new(insert_params)
    secr = SecureRandom.hex[0, 8]
    @paper.secr = Digest::SHA1.hexdigest secr
 
    if @paper.save
      render plain: params[:paper].inspect + " secr: " + secr.inspect
    else
      render 'new'
    end
  end

  private
    def insert_params
      params.require(:paper).permit(:paperid, :secr, :preprint, :abstract, :controverse1, :controverse2, :controverse3)
    end

    def check_secr(secr)
      if secr.nil?
        render plain: "Missing security token!" 
        return false
      end
      
      @paper = Paper.find(params[:paperid])
      if @paper.secr == (Digest::SHA1.hexdigest secr)
        return true
      else
        render plain: "Wrong security token!" 
        return false
      end
    end
end
