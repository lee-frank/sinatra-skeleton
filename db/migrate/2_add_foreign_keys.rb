class AddForeignKeys < ActiveRecord::Migration
    def change
        change_table :reviews do |t|
            t.references :movie
            t.references :user
        end

    end

end