post '/dashboard/new' do
	@db_error = Website.create(social_media_link: params[:url], user_id: session[:user_id])
	p @db_error


	redirect '/dashboard'
end

get '/dashboard' do
	@add_url = true
	@my_places = Website.where(user_id: session[:user_id])
	if @my_places == nil
		@my_places = ["You don't have any websites to load."]
	end.to_a

	erb :'/dashboard/index'
end