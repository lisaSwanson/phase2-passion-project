# before do
#   pass if request.path_info =~ /^\/auth\//
#   redirect to('/auth/twitter') unless logged_in?
# end

get '/auth/twitter' do
  session[:twitter_oauth] = env['omniauth.auth'][:twitter]
  redirect to('/')
end

get '/auth/twitter/callback' do
  # probably you will need to create a user in the database too...
  #p params
  p request.env['omniauth.auth'][:uid]
  p "@" * 80
  "<pre>#{JSON.pretty_generate(request.env['omniauth.auth'])}</pre>"
  # this is the main endpoint to your application
  #redirect to('/dashboard')
end

get '/auth/failure' do
  # omniauth redirects to /auth/failure when it encounters a problem
  p params[:message]
end
