class ProspectsController < ApplicationController

  def index
    @prospects = Prospect.all
  end

  def show
    @prospect = Prospect.find_by_id(params[:id])
  end

  def new
    @prospect = Prospect.new
  end

  def create
    @prospect = Prospect.new
    @prospect.name = params[:name]
    @prospect.email = params[:email]
    
    if @prospect.save
      redirect_to prospects_url
    else
      render 'new'
    end
  end

  def edit
    @prospect = Prospect.find_by_id(params[:id])
  end

  def update
    @prospect = Prospect.find_by_id(params[:id])
    @prospect.name = params[:name]
    @prospect.email = params[:email]
    
    if @prospect.save
      redirect_to prospects_url
    else
      render 'new'
    end
  end

  def destroy
    @prospect = Prospect.find_by_id(params[:id])
    @prospect.destroy
    redirect_to prospects_url
  end
end
