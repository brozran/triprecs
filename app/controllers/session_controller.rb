class SessionController < ApplicationController

  def new
    render :layout => 'bgimage.html.erb'
  end

  def create
    user = User.find_by(:email => params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to trips_url, :notice => "Welcome back, #{user.first_name}."
    else
      flash.now[:error] = "Something went wrong. Please try again."
      render 'new'
    end
  end

def sessionback
    user = User.find_by(:email => params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id

      count = 0
      friends = Friend.all
      friends.each do |f|
        if (f.f1 = user.id && f.f2 = params[:tripowner]) || (f.f2 = user.id && f.f1 = params[:tripowner])
          count += 1
        else
          count += 0
        end
      end

      if count > 0
        redirect_to :back, :notice => "Welcome back, #{user.first_name}."
      else

        n = Friend.new
        n.f1 = user.id
        n.f2 = params[:tripowner]
        n.confirmed = true
        n.save
        redirect_to :back, :notice => "Welcome back, #{user.first_name}."
      end

      else
        flash.now[:error] = "Something went wrong. Please try again."
        render 'new'
    end

  end


  def destroy
    reset_session
    redirect_to home_url, :notice => "Signed out successfully."
  end


end
