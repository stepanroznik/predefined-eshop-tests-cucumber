Feature: Cart Operations

    Background: The user visits the home page
        Given the user is on the "store" page

    Scenario: Viewing items in the cart
        When the user adds "fugiat fugiat" to the cart
        And the user increases the quantity of "fugiat fugiat"
        And the user increases the quantity of "fugiat fugiat" again

        When the user adds "laborum culpa" to the cart
        And the user adds "culpa cupidatat" to the cart
        And the user adds "ex qui" to the cart

        When the user clicks on the "Cart" navigation link
        Then the url should contain "/cart"

        And the cart should contain the following items
            | name            | quantity | price |
            | fugiat fugiat   | 3        | 60    |
            | laborum culpa   | 1        | 200   |
            | culpa cupidatat | 1        | 139   |
            | ex qui          | 1        | 41    |

        And the user should see "total 440 €" displayed on the page

    Scenario: Removing Items from the cart
        When the user adds "fugiat fugiat" to the cart
        When the user adds "labore excepteur" to the cart
        And the user adds "sint elit" to the cart
        And the user increases the quantity of "sint elit"

        When the user clicks on the "Cart" navigation link
        Then the url should contain "/cart"

        And the cart should contain "3" items
        Then the total price should be "55"

        When the user removes "fugiat fugiat" from the cart
        Then the total price should be "35"

        When the user removes "labore excepteur" from the cart
        Then the total price should be "24"
        Then the cart should contain "1" item

        When the user clicks on the "Store" navigation link
        Then the url should contain "/store"

        And the product "fugiat fugiat" should contain "Buy"
        And the product "labore excepteur" should contain "Buy"
        And the product "sint elit" should not contain "Buy"
