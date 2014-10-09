# new user signn up
post '/signup' do
  # erb :user_home
  user = User.new(params[:user])
  if user.save
    # session[:id] = user.id
    redirect "/user/#{user.id}"
  end
end

post '/signin' do
  user = User.find_by(username: params[:username])
  if user.password == params[:password]
    # session[:id] = user.id
    redirect "/user/#{user.id}"
  else
    redirect '/'
  end
end
