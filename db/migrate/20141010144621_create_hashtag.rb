class CreateHashtag < ActiveRecord::Migration
  def change
    create_table :hashtag do |t|
      t.string :tag
      t.references :skeets
    end
  end
end
