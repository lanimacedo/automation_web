class NavBar < SitePrism::Section
  element :input_search, 'input[id=h_search-input]'

  def search(dados)
    input_search.set dados
    sleep(1)
    input_search.send_keys :enter
  end
end