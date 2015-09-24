get '/profile' do
	@user = auth_current_user
	@age =  get_age(@user)

  erb :'user_profile'
end

get '/login' do

  erb :'user_login'
end

post '/login' do
	session.destroy
	@user = User.find_by(email: params[:email])

	if @user == nil || @user.password != params[:password] 
    @form_error = 'That email or password is invalid' 

    erb :'user_login'
  else 
    auth_login(@user)
    # @my_places = Website.where(user_id: session[:user_id])
    # flash[:message] = 'Thank you for logging in'

    redirect '/dashboard'
  end

end

get '/logout' do
	auth_logout

	erb :home_index
end

get '/signup' do

	erb :'user_signup'
end

post '/signup' do
	if params[:password] != params[:confirm_password] || params.any?{|k, v| v == ""}
		@form_refill = make_form_object(params)

		erb :'user_signup'
	else
		format_birthday(params)
		@user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], birthday: @birthday, gender: params[:gender])
		auth_login(@user)

		redirect '/dashboard/'
	end
end

get '/update' do
	@user = User.find(session[:user_id])
	make_birthday_object(@user.birthday)

	erb :'user_update'
end

post '/user/update' do
	update_user(params)

	# erb :'/dashboard/index'
	redirect '/dashboard'
end


get '/delete' do
	@user = User.find(session[:user_id])
	@user.destroy
	session.destroy

	erb :'home_index'
end


