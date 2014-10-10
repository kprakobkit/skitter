# new user signn up
get '/signup' do
  erb :user_login
end

post '/signup' do
  # erb :user_home
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    user.first_skeet
    user.followers << user
    redirect "/signup"
  end
end

post '/signup/new' do
  user = current_user
  user.update_attributes(params[:user])
  redirect "/user/#{user.id}"
end

post '/signin' do
  user = User.find_by(username: params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  else
    redirect '/'
  end
end

post '/logout' do
  session[:user_id] = nil

  redirect '/'
end
