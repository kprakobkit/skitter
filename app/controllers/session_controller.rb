# new user signn up
post '/signup' do
  # erb :user_home
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    user.first_skeet
    user.followers << user
    redirect "/user/#{user.id}"
  end
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
