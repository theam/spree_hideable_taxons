Deface::Override.new(virtual_path: 'spree/shared/_taxonomies',
  name: 'hide_taxonomies_with_hidden_root_taxons',
  surround_contents: "erb[silent]:contains('cache [I18n.locale, taxonomy, max_level, @taxon] do')",
  closing_selector: "erb[silent]:contains('end')",
  text: "
    <% unless taxonomy.root.hidden? %>
      <%= render_original %>
    <% end %>
  ")
