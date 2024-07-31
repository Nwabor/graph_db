class CreatePersonRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :person_relationships do |t|
      t.string :role_one
      t.string :role_two
      t.references :person_one, null: false, foreign_key: true
      t.references :person_two, null: false, foreign_key: true

      t.timestamps
    end
  end
end
