class VisitsController < ApplicationController

before_action :check_if_owner, only: [:destroy]


 def check_if_owner
  visit = visit.find(params[:id])
    if visit.user_id != current_user.id
      redirect_to "/visit", notice: "Don't you want to see YOUR visits?!"
    end
  end
  def index
    @visits = current_user.visits

  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new
    @visit.user_id = current_user.id
    @visit.restaurant_id = params[:restaurant_id]

    if @visit.save
      redirect_to "/visits", :notice => "Visit created successfully."
    else
      render 'new'
    end



    if @visit.save
      redirect_to "/visits", :notice => "Visit updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @visit = Visit.find(params[:id])

    @visit.destroy

    redirect_to "/visits", :notice => "Visit deleted."
  end
end
