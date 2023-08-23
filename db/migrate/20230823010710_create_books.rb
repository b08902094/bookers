class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title #title of the book
      t.string :body #reflection
      t.timestamps
    end
  end
end
