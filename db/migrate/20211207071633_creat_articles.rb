class CreatArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string:title
      t.string:description
    end
  end
end
