class FriendsController < ApplicationController

  before_action :user_must_be_present, :only => [:index]
  def user_must_be_present
    if current_user.blank?
      redirect_to trips_url, :notice =>"You must be signed in."
  end
  end

  def index
  # definition of friends defined below
    @confirmedfriends = Friend.where(:confirmed => true)

    friendsapproved = @confirmedfriends.where(:f2 => current_user.id)
    friendsrequestedapproved = @confirmedfriends.where(:f1 => current_user.id)

    @friends = []
    @userfriends=[]
    @friendsa=[]
    @friendsr=[]
      friendsapproved.each do |a|
        @friendsa << a
        # @userfriends << User.find_by_id(a.f1)
      end

      friendsrequestedapproved.each do |r|
        @friendsr << r
        # @userfriends << User.find_by_id(r.f2)
      end

    @friendlist = User.where(:id => @friends)
  # definition of friends defined above
    @unconfirmedfriends = Friend.where(:confirmed => false)
    @almostfriends = @unconfirmedfriends.where("f1 = ? OR f2 = ?", current_user.id, current_user.id)

  end

  def friendconfirm


  end

  def show
    @friend = Friend.find_by_id(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new
    @friend.f1 = current_user.id
    @friend.f2 = params[:f2]
    @friend.confirmed = false

    if @friend.save
      redirect_to friends_url
    else
      render 'new'
    end
  end

  def edit
    @friend = Friend.find_by_id(params[:id])
  end

  def update
    @friend = Friend.find_by_id(params[:id])
    @friend.f1 = params[:f1]
    @friend.f2 = params[:f2]
    @friend.confirmed = params[:confirmed]

    if @friend.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    @friend = Friend.find_by_id(params[:id])
    @friend.destroy
    redirect_to friends_url
  end
end
