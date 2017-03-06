class AddHiddenToSpreeTaxons < ActiveRecord::Migration
  def change
    add_column :spree_taxons, :hidden, :boolean, default: false
  end
end
