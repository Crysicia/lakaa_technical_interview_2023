class AddDeletedToIndicators < ActiveRecord::Migration[7.0]
  def change
    change_table :indicators do |t|
      t.boolean :deleted, null: false, default: false
    end
  end
end
