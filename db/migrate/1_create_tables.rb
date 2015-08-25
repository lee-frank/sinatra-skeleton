class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :movies do |t|
      # Your code goes here
      t.string :title
      t.date :release_date
      t.string :genre
      t.text :description
      t.string :image_url
      t.timestamps
    end

    create_table :reviews do |t|
      # Your code goes here
      t.string :score
      t.string :comment
      t.string :tagline
      t.timestamps
    end

  end

end