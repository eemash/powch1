class VisitsController < ApplicationController
  def index
    @visits = Visit.all
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new
    @visit.restaurant = params[:restaurant]
    @visit.email = params[:email]
    @visit.date = params[:date]

    if @visit.save
      redirect_to "/visits", :notice => "Visit created successfully."
    else
      render 'new'
    end
  end

  def edit
    @visit = Visit.find(params[:id])
  end

  def update
    @visit = Visit.find(params[:id])

    @visit.restaurant = params[:restaurant]
    @visit.email = params[:email]
    @visit.date = params[:date]

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
