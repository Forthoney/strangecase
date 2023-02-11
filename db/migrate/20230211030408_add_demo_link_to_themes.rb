class AddDemoLinkToThemes < ActiveRecord::Migration[7.0]
  def change
    add_column :themes, :demo_link, :string
  end
end
