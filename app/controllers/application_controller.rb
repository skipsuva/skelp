class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    @bar = Bar.order("RANDOM()").first
    erb :index
  end


  post '/new' do
    @review = Review.new(rating: params[:review][:rating], comment: params[:review][:comment], would_recommend: params[:review][:recommend])
    if params[:bar][:existing] != nil
      @bar = Bar.find_by_name(params[:bar][:existing][:name])
    else
      @bar = Bar.create(name: params[:bar][:new][:name], address: params[:bar][:new][:address], theme: params[:bar][:new][:theme], img_url: params[:bar][:new][:img_url])
    end

    if Patron.find_by_email(params[:patron][:email]) != nil
      @patron = Patron.find_by_email(params[:patron][:email])
    else
      @patron = Patron.create(name: params[:patron][:name], email: params[:patron][:email], age: params[:patron][:age])
    end

    @review.bar_id = @bar.id
    @review.patron_id = @patron.id
    @review.save

    redirect to "/bars/#{@bar.slug}"
  end

end
