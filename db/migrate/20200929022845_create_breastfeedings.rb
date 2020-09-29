class CreateBreastfeedings < ActiveRecord::Migration[5.2]
  def change
    create_table :breastfeedings do |t|
      t.timestamp :datetime
      t.integer :quantity
      t.integer :length
      t.references :baby, foreign_key: true

      t.timestamps
    end
  end
end
