class CreateSkeets < ActiveRecord::Migration
  def change
    create_table :skeets do |t|
      t.string :skeet
      t.references :user
      t.timestamps
    end
  end
end
