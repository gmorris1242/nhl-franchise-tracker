class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :season, index: true
      t.string :transaction_type
      t.text :details

      t.timestamps
    end
  end
end
