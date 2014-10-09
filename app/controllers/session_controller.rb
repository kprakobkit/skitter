# new user signn up
post '/signup' do
  # erb :user_home
  user = User.new(params[:user])
  user.password = params[:password]
  if user.save
    session[:id] = user.id
    redirect '/user/:id'
  end
end

post '/signin' do
  # erb :user_home
  @user = User.find_by(params[:username])
  if @user.password == params[:password]
    give_token
  else
    redirect '/'
  end
end
