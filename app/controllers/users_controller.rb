class UsersController < ApplicationController

  def index
    # @users = User.all

    # @usersfiltered = User.where("first_name LIKE?", "%#{params[:first_name]}%" )

    @usersfiltered = User.where("first_name LIKE :search_name or last_name LIKE :search_name" ,
                             search_name: "%#{params[:search_word]}%" )

    @confirmedfriends = Friend.where(:confirmed => true)
    friendsapproved = @confirmedfriends.where(:f2 => current_user.id)
    friendsrequestedapproved = @confirmedfriends.where(:f1 => current_user.id)


    approved_ids = []

    approved_ids = friendsapproved.map { |fa| fa.f1 } if friendsapproved.present?

    approved_ids += friendsrequestedapproved.map { |fra| fra.f2 } if friendsrequestedapproved.present?

    approved_ids.uniq!  # (May not be needed)

    @usersfiltered.delete_if { |user| approved_ids.include? user.id }

  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
    render :layout => 'bgimage.html.erb'
  end

  def create
    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    if @user.save
      UserMailer.signup_email(@user).deliver
      reset_session
      session[:user_id] = @user.id
      redirect_to trips_url, notice: "Signed up successfully."
    else
      render 'new'
    end
  end

  def createback

    @user = User.new
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]

    @friendship = Friend.new
    @friendship.f2 = params[:tripowner]

    if @user.save
    @friendship.f1 = @user.id
    @friendship.confirmed = true
    @friendship.save


    reset_session
    session[:user_id] = @user.id

    redirect_to :back, notice: "Signed up successfully."

    else
      render 'new'
    end
  end


  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    @user.password_digest = params[:password_digest]

    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to login_url
  end
end
