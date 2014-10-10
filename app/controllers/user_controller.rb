
# post new tweet
post '/user/:id/new' do
  # create a skeet for the user
  current_user.skeets.create(skeet: params[:skeet])
  @all_skeets = current_user.get_all_skeets
  erb :user_home
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
  # bio
  # all their tweets
  @user = User.find(params[:id])
  # @user_followees = @user.followees
  @all_skeets = @user.get_all_skeets
  erb :user_home
end

# profile page
get '/user/:id/profile/:partial' do
  @users = User.all
  @partial = params[:partial]
  erb :profile
end


