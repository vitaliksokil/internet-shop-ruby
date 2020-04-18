atom_feed do |feed|
  feed.title "Who bought #{@product.title}"
  feed.updated @latest_order.try(:updated_at)
  @products.each do |order|
    feed.entry(order.product) do |entry|
      entry.summary type: 'xhtml' do |xhtml|
        xhtml.table do
          xhtml.tr do
            xhtml.th 'Product'
            xhtml.th 'Quantity'
            xhtml.th 'Total Price'
          end
          order.product.line_items.each do |item|
            xhtml.tr do
              xhtml.td item.product.title
              xhtml.td item.quantity
              xhtml.td number_to_currency item.total_price
            end
          end
          xhtml.tr do
            xhtml.th 'total', colspan: 2
            xhtml.th number_to_currency \
order.product.line_items.map(&:total_price).sum
          end
        end
      end
    end
  end
end