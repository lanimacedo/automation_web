Dir[File.join(File.dirname(__FILE__), '../page/*_page.rb')].each { |file| require file}

# instanciar pages
module Pages
  def home_page
    @home_page ||= HomePage.new
  end

  def search_page
    @search_page ||= ResultSearch.new
  end

  def detail_page
    @detail_page ||= DetailProductPage.new  
  end

  def warranty_page
    @warranty_page ||= WarrantyPage.new
  end

  def basket_page
    @basket_page ||= BasketPage.new
  end
end