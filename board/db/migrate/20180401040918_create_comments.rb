class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :my_thread, foreign_key: true

      t.timestamps
    end
  end
end
