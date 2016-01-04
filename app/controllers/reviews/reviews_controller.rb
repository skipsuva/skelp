class ReviewsController < ApplicationController

  get '/new' do
    @bars = Bar.all
    erb :'reviews/new'
  end

  post '/new' do
    params
    redirect to '/bars/#{bar.slug}'
  end


end
