class ResultSearch < SitePrism::Page
  element :title, 'h1[class="h1 page-title"]'

  elements :list_items, '#content-middle div[data-tracker="productgrid-main"] div[class^="product-grid-item"]'
end