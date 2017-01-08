class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.text :question
      t.references :status, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
