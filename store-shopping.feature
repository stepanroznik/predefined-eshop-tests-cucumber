Feature: Store Shopping

    Background: The user visits the home page
        Given the user is on the "store" page

    Scenario: Buying a product increases cart icon count
        When the user adds "labore excepteur" to the cart
        Then the cart icon should contain "1"

        When the user increases the quantity of "labore excepteur"
        Then the cart icon should contain "2"
        When the user increases the quantity of "labore excepteur"
        Then the cart icon should contain "3"

        When the user decreases the quantity of "labore excepteur"
        And the user decreases the quantity of "labore excepteur" again
        And the user decreases the quantity of "labore excepteur" again
        Then the cart icon should contain "0"

        But the product "labore excepteur" should contain "Buy"

    Scenario: Buying multiple products
        When the user adds "labore excepteur" to the cart
        And the user adds "sint elit" to the cart
        Then the cart icon should contain "2"

        When the user decreases the quantity of "labore excepteur"
        Then the cart icon should contain "1"

        When the user decreases the quantity of "sint elit"
        Then the cart icon should contain "0"

        And the product "labore excepteur" should contain "Buy"
        And the product "sint elit" should contain "Buy"

