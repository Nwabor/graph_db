class CreatePeople < ActiveRecord::Migration[7.1]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :given_last_name
      t.string :gender

      t.timestamps
    end
  end
end
