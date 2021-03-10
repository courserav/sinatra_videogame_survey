class CreateSurveys < ActiveRecord::Migration[6.0]
    def change
        create_table :surveys do |t|
            t.string :console
            t.string :genre
            t.integer :user_id
        end
    end
end
