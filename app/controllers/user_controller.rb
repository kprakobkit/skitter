# displaying all the info for user view
get '/user/:id' do
  # bio
  # all thier tweets
  @user = User.find(params[:id])
  @user_skeets = @user.skeets
  erb :user_home
end

# post new tweet
post '/user/:id/new' do
  skeet = Skeet.create(params[:id])
  erb :user_home
end
