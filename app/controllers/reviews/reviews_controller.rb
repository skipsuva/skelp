class ReviewsController < ApplicationController

  get '/new' do
    erb :'reviews/new'
  end

  post '/new' do
    params
    redirect to '/bars/#{bar.slug}'
  end


end
