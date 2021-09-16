class WebinarsController < ApplicationController
  def index
    @webinars = Webinar.all
  end

  def show
    @webinar = Webinar.find(params[:id])
  end

  def new
    @webinar = Webinar.new
  end

  def create
    @webinar = Webinar.new(webinar_params)
    @webinar.subscribers = 0

    if @webinar.save
      redirect_to @webinar
    else
      render :new
    end
  end

  def edit
    @webinar = Webinar.find(params[:id])
  end

  def update
    @webinar = Webinar.find(params[:id])

    if @webinar.update(webinar_params)
      redirect_to @webinar
    else
      render :edit
    end
  end

  def destroy
    @webinar = Webinar.find(params[:id])
    @webinar.destroy
    
    redirect_to root_path, notice: "Removed the webinar."
  end

  def signup
    @webinar = Webinar.find(params[:id])
  end

  def signup_confirm
    @webinar = Webinar.find(params[:id])
    redirect_to @webinar, notice: "Signed up for #{@webinar.title}!"
  end

  private
  def webinar_params
    params.require(:webinar).permit(:title, :body, :price, :startdate)
  end
end
