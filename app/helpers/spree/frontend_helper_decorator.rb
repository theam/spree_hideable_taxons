Spree::FrontendHelper.module_eval do

  def taxons_tree(root_taxon, current_taxon, max_level = 1)
    return '' if max_level < 1 || root_taxon.leaf? || root_taxon.hidden?
    content_tag :div, class: 'list-group' do
      taxons = root_taxon.children.map do |taxon|
        next if taxon.hidden?
        css_class = (current_taxon && current_taxon.self_and_ancestors.include?(taxon)) ? 'list-group-item active' : 'list-group-item'
        link_to(taxon.name, seo_url(taxon), class: css_class) + taxons_tree(taxon, current_taxon, max_level - 1)
      end
      safe_join(taxons.compact, "\n")
    end
  end

end
