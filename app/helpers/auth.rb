helpers do

  # define a current_user method, so we can be sure if an user is authenticated
  def current_user
    !session[:uid].nil?
  end

  def auth_logged_in?
    !session[:user_id].nil?
  end

  def auth_login(user)
    session[:user_id] = user.id
  end

  def auth_logout
    session.destroy
  end

  def auth_current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def get_age(current_user)
    dob = @current_user.birthday
    @birthday_obj = make_birthday_object(dob)
    now = Time.new
    @age = now.year - @birthday.year.to_i
  end

  Birthday = Struct.new(:year, :month, :day)
  def make_birthday_object(bday)
  	array = bday.split("-").to_a
  	@birthday = Birthday.new(array[0], array[1], array[2])
  end

  def format_birthday(params)
		@birthday = "#{params[:year]}-#{params[:month]}-#{params[:day]}"
  end

  def update_user(params)
    format_birthday(params)
    auth_current_user
    if @birthday != @current_user.birthday
      @current_user.update(:birthday => @birthday)
    end
    @current_user.attributes.each do |an, av|
      params.each_pair do |k, v| 
        if an == k && av != v
          @current_user.update(an => v) 
        end
      end
    end
  end

  FormData = Struct.new(:first_name, :last_name, :email, :password, :gender)
  def make_form_object(params)

    return @form_data = FormData.new(params[:first_name], params[:last_name], params[:email], params[:password], params[:gender])
  end

  def get_my_places
    @my_places = Website.find_by(user_id: session[:user_id])
  end

end