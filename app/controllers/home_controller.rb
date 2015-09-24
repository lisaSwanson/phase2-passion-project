get '/' do
	@user = session[:user_id]
	
  erb :home_index
end

