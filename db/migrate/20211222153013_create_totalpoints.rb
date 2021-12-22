class CreateTotalpoints < ActiveRecord::Migration[5.2]
  def change
    create_table :totalpoints do |t|
      t.integer :user_id, :null => false
      t.integer :point, :null => false, :default => 0

      t.timestamps
    end
  end
end
