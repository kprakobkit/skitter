
# post new tweet
post '/user/:id/new' do
  # create a skeet for the user
  current_user.skeets.create(skeet: params[:skeet])
  @user = User.find(params[:id])
  @all_skeets = @user.get_all_skeets
  erb :user_home
end

post '/user/:id/reskeet/:author_id/:skeet' do
  # create a skeet for the user
  current_user.skeets.create(
    skeet: params[:skeet],
    reskeet: true,
    author_id: params[:author_id]
  )

  redirect "/user/#{params[:id]}"
end

# delete a tweet
post '/user/:id/edit/:skeet_id' do
  @skeet = Skeet.find(params[:skeet_id])
  @skeet.delete
  @skeet.save
  redirect "/user/#{params[:id]}/profile/user_skeets"
end

# displaying all the info for user view
get '/user/:id' do
  @user = User.find(params[:id])
  @all_skeets = @user.get_all_skeets
  erb :user_home
end

# profile page
get '/user/:id/profile/:partial' do
  @users = User.all
  @partial = params[:partial]
  @user = User.find params[:id]
  @all_skeets = @user.get_all_skeets

  erb :profile
end

post '/follow/:id' do
  @action = "follow"
  if logged_in?
    @user = User.find params[:id]
    unless current_user.followees.exists?(id: @user.id)
      current_user.followees << @user
    end
    erb :success
  else
    erb :not_logged_in
  end
end

post '/unfollow/:id' do
  @action = "unfollow"
  if logged_in?
    @user = User.find params[:id]
    current_user.followees.delete @user
    erb :success
  else
    erb :not_logged_in
  end
end
