# displaying all the info for user view
get '/user/:id' do
  # bio
  # all their tweets
  @user = User.find(params[:id])
  @user_skeets = @user.skeets
  erb :user_home
end

# post new tweet
post '/user/:id/new' do
  # create a skeet for the user
  current_user.skeets.create(skeet: params[:skeet])

  erb :user_home
end
