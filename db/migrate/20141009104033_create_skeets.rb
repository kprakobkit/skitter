class CreateSkeets < ActiveRecord::Migration
  def change
    create_table :skeets do |t|
      t.string :skeet
      t.references :user
      t.references :author
      t.boolean :reskeet, default: false
      t.timestamps
    end
  end
end
