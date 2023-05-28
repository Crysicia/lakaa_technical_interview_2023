class CreateIndicators < ActiveRecord::Migration[7.0]
  def change
    create_table :indicators do |t|
      t.string :name, null: false
      t.string :unit, null: false
      t.boolean :required, default: false

      t.timestamps
    end
  end
end
