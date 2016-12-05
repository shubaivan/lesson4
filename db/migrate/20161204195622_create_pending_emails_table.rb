class CreatePendingEmailsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :pending_emails do |t|
      t.references :list, foreign_key: true
      t.string :email
    end
  end
end
