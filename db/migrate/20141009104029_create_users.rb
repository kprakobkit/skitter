class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :password_hash, :name, :state, :city, :email, :bio
      t.timestamps
    end
  end
end
