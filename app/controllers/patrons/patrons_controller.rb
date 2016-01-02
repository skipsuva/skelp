class PatronsController < ApplicationController

  get '/' do
    @patrons = Patron.all
    erb :'patrons/index'
  end

  get '/:slug' do
    @patron = Patron.find_by_slug(params[:slug])
    erb :'/patrons/show'
  end

  get '/edit/:id' do
    @review = Review.find_by_id(params[:id])
    erb :'patrons/edit'
  end

  post '/edit/:id' do
    @review = Review.find_by_id(params[:id])
    @patron = Patron.find_by_id(@review.patron_id)
    @review.rating = params[:review][:rating]
    @review.comment = params[:review][:comment]
    @review.would_recommend = params[:review][:recommend]
    @review.save
    redirect to "/#{@patron.slug}"
  end

  post '/:id/delete' do
    @review = Review.find(params[:id])
    @patron = Patron.find_by_id(@review.patron_id)
    @review.destroy
    redirect to "/#{@patron.slug}"
  end

end
