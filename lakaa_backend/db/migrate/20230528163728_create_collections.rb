class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.datetime :collected_at, null: false
      t.string :organization_name, null: false

      t.timestamps
    end
  end
end
