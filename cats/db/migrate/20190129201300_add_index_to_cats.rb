class AddIndexToCats < ActiveRecord::Migration[5.2]
  def change
    add_index :cats, :birth_date
    add_index :cats, :color
    add_index :cats, :sex
  end
end
