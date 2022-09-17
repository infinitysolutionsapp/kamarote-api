class AddDocumentCellToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :tel, :string
    add_column :users, :document, :string
  end
end
