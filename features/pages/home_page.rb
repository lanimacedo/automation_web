require_relative 'sections'

class HomePage < SitePrism::Page
  set_url ''

  section :navbar, NavBar, '.main-header'
end