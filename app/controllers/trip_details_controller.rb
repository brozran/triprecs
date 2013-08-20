class TripDetailsController < ApplicationController

  def index
    @trip_details = TripDetail.all
  end

  def show
    @trip_detail = TripDetail.find_by_id(params[:id])
  end

  def new
    @trip_detail = TripDetail.new
  end

  def create
    @trip_detail = TripDetail.new
    @trip_detail.city_or_region = params[:city_or_region]
    @trip_detail.recommendation_needs = params[:recommendation_needs]
    @trip_detail.trip_id = params[:trip_id]


    if @trip_detail.save
      redirect_to :back

      # trip_details_url
    else
      render 'new'
    end
  end

  def edit
    @trip_detail = TripDetail.find_by_id(params[:id])
  end

  def update
    @trip_detail = TripDetail.find_by_id(params[:id])
    @trip_detail.city_or_region = params[:city_or_region]
    @trip_detail.recommendation_needs = params[:recommendation_needs]
    @trip_detail.trip_id = params[:trip_id]

    if @trip_detail.save
      redirect_to trip_details_url
    else
      render 'new'
    end
  end

  def destroy
    @trip_detail = TripDetail.find_by_id(params[:id])
    @trip_detail.destroy
    redirect_to :back


  end
end
