class TripsController < ApplicationController

before_action :user_must_be_present, :only => [:new, :mytrips]
  def user_must_be_present
    if current_user.blank?
      redirect_to trips_url, :notice =>"You must be signed in."
  end
  end


  def homepage
  end

  def index
    @trips = Trip.all
    @trip_details = TripDetail.all
    @trip_owner = User.all
  end

  def show
    @trip = Trip.find_by_id(params[:id])
    @trip_details = TripDetail.where(:trip_id => Trip.find_by_id(params[:id]))
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new
    @trip.trip_name = params[:trip_name]
    @trip.userid = params[:userid]

    if @trip.save
      redirect_to trip_url(@trip.id)
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find_by_id(params[:id])
  end

  def update
    @trip = Trip.find_by_id(params[:id])
    @trip.trip_name = params[:trip_name]

    if @trip.save
      redirect_to trips_url
    else
      render 'new'
    end
  end

  def recs

      @trip = Trip.find_by_id(params[:id])
      @tripowner=User.find_by_id(@trip.userid)
      @trip_details = TripDetail.where(:trip_id => Trip.find_by_id(params[:id]))
      @recommendations = Comment.all
  end

  def mytrips
      @mytrips = Trip.where(:userid => current_user.id)
      @trip_details = TripDetail.all
  end

  def destroy
    @trip = Trip.find_by_id(params[:id])
    @trip.destroy
    redirect_to trips_url
  end

end

