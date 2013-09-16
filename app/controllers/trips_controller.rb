class TripsController < ApplicationController

before_action :user_must_be_present, :only => [:new, :mytrips, :index]
  def user_must_be_present
    if current_user.blank?
      redirect_to home_url
  end
  end


  def homepage
    render :layout => 'bgimage.html.erb'
  end

  def index

    @confirmedfriends = Friend.where(:confirmed => true)
    friendsapproved = @confirmedfriends.where(:f2 => current_user.id)
    friendsrequestedapproved = @confirmedfriends.where(:f1 => current_user.id)

    @friends = []

    @friends << current_user.id

    friendsapproved.each do |a|
      @friends << a.f1
    end
    friendsrequestedapproved.each do |r|
      @friends << r.f2
    end

    # end


    # @trips = Trip.where(userid: [@friends, current_user.id])
    @trips = Trip.where(:userid => @friends).order("departuredate")


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
    @trip.departuredate = params[:departuredate]
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
      @mytrips = Trip.where(:userid => current_user.id).order("departuredate")
      @trip_details = TripDetail.all
  end

  def destroy
    @trip = Trip.find_by_id(params[:id])
    @trip.destroy
    redirect_to my_trips_url
  end

  def testhome
    render :layout => 'testhome.html.erb'
  end


end

