class ChangeColumnInReviews < ActiveRecord::Migration[5.1]
  def change
    change_column :reviews, :would_recommend, :boolean, default: false
  end
end
