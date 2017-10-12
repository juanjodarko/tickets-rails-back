class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.numeric :customer_id
      t.numeric :agent_id
      t.timestamp :close_date

      t.timestamps
    end
  end
end
