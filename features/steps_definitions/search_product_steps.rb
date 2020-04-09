Dado('what access to the main url') do
  home_page.load

  expect(page.current_url).to eql CONFIG['url_default']
end

Dado('view the home banner') do
  expect(page).to have_css('picture[class="hdr-bnr-image"]')
end

Quando('I search for {string}') do |string|
  @product = string

  home_page.navbar.search(@product)
end

Quando("valid if the search result matches the searched product") do
  sleep(2)

  expect(search_page.title.text).to eql(@product)
  
  @list = search_page.list_items.select { |li| li.text.include? @product }
  
  expect(@list.length).to be > 0
end

Quando("add a product from the list to the cart") do
  @list.first.find('h2').click
  
  expect(detail_page.title_product.text.downcase).to have_content @product
  
  detail_page.btn_buy.click

  warranty_page.btn_next.click
end

Então("the researched product must be displayed in the cart") do
  expect(basket_page.title_page.text).to eql 'minha cesta'

  expect(basket_page.title_product.text.downcase).to have_content @product
end