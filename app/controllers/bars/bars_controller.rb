class BarsController < ApplicationController

  get "/" do
    @bars = Bar.all.order(:name)
    erb :'bars/index'
  end

  get '/search' do
    erb :'bars/search'
  end

  post '/search' do
    # binding.pry
    if Bar.where("name LIKE '%#{params[:name]}%'").first == nil
      redirect to '/'
    else
      @bar = Bar.where("name LIKE '%#{params[:name]}%'").first
      @reviews = Review.all.where(bar_id: @bar.id)
      redirect to "/#{@bar.slug}"
    end
  end

  get '/:slug' do
    @bar = Bar.find_by_slug(params[:slug])
    @reviews = Review.all.where(bar_id: @bar.id)
    erb :'bars/show'
  end

end
