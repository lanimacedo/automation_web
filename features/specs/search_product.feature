
@search_product

Feature: Search for products on the Americanas website
    - Validate that the searched product is being displayed in the search
    - Add the product to the cart and validate if it was added

    Background: access the home successfully
        Given what access to the main url
        And view the home banner

    Scenario Outline: Perform a search and add product to the cart successfully
        When I search for <name_product>
        And valid if the search result matches the searched product
        And add a product from the list to the cart
        Then the researched product must be displayed in the cart
    
    Examples:
    | name_product | 
    | 'mouse'      | 
    | 'mesa'       |
