class ChangeColumnDefaultToPoints < ActiveRecord::Migration[5.2]
  def change
    change_column_default :points, :point, from: 0, to: 1
  end
end
