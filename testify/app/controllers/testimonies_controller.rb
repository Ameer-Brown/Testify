
class TestimoniesController < ApplicationController
include HTTParty
format :json
  def index
  end

  def search
  if params[:search] != nil
    @search = params[:search]
    #Use interpulation on refactor
    @testimonies = HTTParty.get('https://api.biblia.com/v1/bible/search/LEB.js?query='+ @search + '&mode=verse&start=0&limit=50&key=5f2273dfa89f32a2232474c83fac3921')
  else
    @testimonies = HTTParty.get('https://api.biblia.com/v1/bible/search/LEB.js?query=jesus&mode=verse&start=0&limit=50&key=5f2273dfa89f32a2232474c83fac3921')
  end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
