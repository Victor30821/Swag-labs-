**Settings**
Library         SeleniumLibrary


** Variables **
${url}          https://www.saucedemo.com  
${inputlogin}       css:input[name=user-name]  
${inputpassword}        css:input[name=password]

**Test Cases

Test case happy way
    Open browser         ${url}      chrome
    Title should be     Swag Labs
    Input text      ${inputlogin}       standard_user
    Input text      ${inputpassword}        secret_sauce
    Click element       id:login-button
    Select from list by label       class:product_sort_container        Price (low to high)
    Click element       id:add-to-cart-sauce-labs-onesie
    Click element       id:add-to-cart-test.allthethings()-t-shirt-(red)
    Click element       class:shopping_cart_link
    Page should contain         Test.allTheThings() T-Shirt (Red)
    Page should contain         Sauce Labs Onesie
    Click element       id:checkout
    Input text      id:first-name       Victor
    Input text      id:last-name       Alves
    Input text      id:postal-code       11712150
    Click element       id:continue
    Page should contain         Test.allTheThings() T-Shirt (Red)
    Page should contain         Sauce Labs Onesie
    Click element       id:finish
    Page should contain     THANK YOU FOR YOUR ORDER
    Capture page screenshot 
    Sleep       2

Test case no infos login

    Open browser         ${url}      chrome
    Title should be     Swag Labs
    Click element       id:login-button
    Capture page screenshot 
    Page should contain     Epic sadface: Username is required
    Sleep       2

Test case no password login

    Open browser         ${url}      chrome
    Title should be     Swag Labs
    Input text       ${inputlogin}     standard_user
    Click element       id:login-button
    Page should contain     Epic sadface: Password is required
    Capture page screenshot 
    Sleep       2

Test case incorrect passsword and login 

    Open browser         ${url}      chrome
    Title should be     Swag Labs
    Input text     ${inputlogin}      testandoerrado
    Input text      ${inputpassword}       testmuitoerrado
    Click element       id:login-button
    Capture page screenshot 
    Page should contain     Epic sadface: Username and password do not match any user in this service
    Sleep       2


Do not end up with no products in the cart

    Open browser         ${url}      chrome
    Title should be     Swag Labs
    Input text      ${inputlogin}       standard_user
    Input text      ${inputpassword}        secret_sauce
    Click element       id:login-button
    Click element       class:shopping_cart_link
    Page should contain          Checkout       ##Checa se tem o botão para continuar mesmo sem produtos
    Click element       remove-sauce-labs-backpack      ##Checa o botão de remover para validar se realmente não tem um produto no carrinho. 
    ##Tem um erro aqui já que eu consigo fechar o meu pedido mesmo sem nada no carrinho 


