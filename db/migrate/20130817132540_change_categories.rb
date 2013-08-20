class ChangeCategories < ActiveRecord::Migration
  def change
  	change_table :categories do |t|
  		t.remove :post_id
  	end
  end
end
