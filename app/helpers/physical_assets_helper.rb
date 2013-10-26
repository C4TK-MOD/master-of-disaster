module PhysicalAssetsHelper
  def physical_asset_category_selections
    options_for_select(Category.find_all_by_area("Physical Assets").map{|c|[c.name,c.id]})
  end
end
