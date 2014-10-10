
# post new tweet
post '/user/:id/new' do
  # create a skeet for the user
  current_user.skeets.create(skeet: params[:skeet])
  @all_skeets = current_user.get_all_skeets
  erb :user_home
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

get '/user/:id/profile/:partial' do
  "*" * 50
  p params[:partial]
  @partial = params[:partial]

  erb :profile
end

# Tested erb with temp routes
# get '/show_followers' do
#   erb :followers
# end

# get '/show_followees' do
#   erb :followees
# end
