module PhysicalAssetsHelper
  def physical_asset_categories
    Category.find_all_by_area("Physical Assets", order: :name)
  end

  def physical_asset_category_selections
    options_for_select(physical_asset_categories.map{|c|[c.name,c.id]})
  end
end
