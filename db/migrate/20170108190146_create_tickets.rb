class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.text :question
      t.reference :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end