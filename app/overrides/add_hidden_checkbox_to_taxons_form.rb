Deface::Override.new(virtual_path: 'spree/admin/taxons/_form',
  name: 'add_hidden_checkbox_to_taxons_form',
  insert_after: "erb[loud]:contains('text_field :meta_keywords')",
  text: "
    <%= f.field_container :hidden, class: ['checkbox'] do %>
      <%= f.label :hidden do %>
        <%= f.check_box :hidden %> <%=raw Spree.t(:hidden, scope: :taxon) %>
      <% end %>
      <%= f.error_message_on :hidden %>
    <% end %>
  ")
