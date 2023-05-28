class CreateCollectionIndicators < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_indicators do |t|
      t.references :collection, null: false, foreign_key: true
      t.references :indicator, null: false, foreign_key: true
      t.string :value, null: false

      t.timestamps
    end
  end
end
