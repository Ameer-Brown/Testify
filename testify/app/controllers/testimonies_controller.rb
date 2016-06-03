
class TestimoniesController < ApplicationController
include HTTParty
format :json
  def index
    @testimonies = Testimony.all
    render :index
  end

  def search

  end

  def show
    @testimony = Testimony.find_by_id(params[:id])
  end

  def new
    if params[:search] != nil
     @search = params[:search]
     #Use interpulation on refactor
     @testimonies = HTTParty.get('https://api.biblia.com/v1/bible/search/LEB.js?query='+ @search + '&mode=verse&start=0&limit=50&key=5f2273dfa89f32a2232474c83fac3921')
    else
     @testimonies = HTTParty.get('https://api.biblia.com/v1/bible/search/LEB.js?query=jesus&mode=verse&start=0&limit=50&key=5f2273dfa89f32a2232474c83fac3921')
    end
      @testimony = Testimony.new
  end

  def create
    @testimony = Testimony.new
    @testimony.title = params[:testimony][:title]
    @testimony.verse = params[:testimony][:verse]
    @testimony.user_id = params[:testimony][:user_id]
    if @testimony.save
      redirect_to user_path(@testimony.user_id)
    else
      flash.now[:error] = @testimony.errors.full_messages.join(" , ")
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
