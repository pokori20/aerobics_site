class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.password_digest :string
      t.remember_token :string

      t.timestamps
    end
  end
end
