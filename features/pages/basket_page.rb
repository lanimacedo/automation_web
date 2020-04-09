class BasketPage < SitePrism::Page
  element :title_page, 'header h2'
  element :title_product, 'h2[class="basket-productTitle"] a'
end