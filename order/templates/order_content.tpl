<!DOCTYPE html>
<html lang="en">
<head>
    <title>{$order_title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Existing stylesheet -->
    <link rel="stylesheet" type="text/css" href="coffee.css" media="screen"/>
</head>

<body class="bg-light order-index-page">

<div class="container py-4 order-app">

    {* Include page header *}
    {include file="order_header.tpl"}

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark rounded mb-4 order-navbar">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.php">{$order_title}</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="mainNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="index.php?page=purchaseproduct">Register Product</a></li>
                    {if $username == null}
                    <li class="nav-item"><a class="nav-link" href="index.php?page=customer">Sign Up</a></li>
                    {/if}
                    <li class="nav-item"><a class="nav-link" href="index.php?page=cart">Cart</a></li>
                 
                    {if isset($username) && $username != null && $username != " "}
                    <li class="nav-item"><a class="nav-link" href="index.php?page=review">Review</a></li>
                    <li class="nav-item"><a class="nav-link" href="index.php?page=customerlogin&op=logout">Logout</a></li>
                    {/if}
                </ul>
            </div>
        </div>
    </nav>

    <div class="order-content-card">
        <div class="order-session-bar">
            <div>
                <span class="order-kicker">Checkout</span>
                <strong>Complete your order securely</strong>
            </div>

            {if $username == null && !$supressWelcome}
                <div class="order-session-actions">
                    <a href="index.php?page=purchaseproduct" class="btn btn-outline-primary order-register-button">
                        Register Product
                    </a>
                    <a href="index.php?page=customer" class="btn btn-outline-secondary order-register-button">
                        Sign Up
                    </a>
                    <a href="index.php?page=customerlogin" class="btn btn-primary order-login-button">
                        <span class="order-login-button-icon" aria-hidden="true"></span>
                        <span>{echo phrase="CUSTOMER_LOGIN"}</span>
                    </a>
                </div>

            {elseif $username == " "}

            {elseif isset($username) && !$supressWelcome}
                <div class="order-user-pill">
                    <span>
                        {echo phrase="WELCOME_BACK"}, {$username}!
                    </span>
                    <a href="index.php?page=customerlogin&op=logout">Logout</a>
                </div>
            {/if}
        </div>

        <div class="order-content-body">

            {* Display any error messages *}
            {page_errors}

            {* Display any page messages *}
            {page_messages}

            {* Include the page content *}
            {include file="$content_template"}

        </div>
    </div>

    {* Include page footer *}
    {include file="order_footer.tpl"}

    <footer class="text-center text-muted mt-4 small order-credit">
        &copy; 2011-{$smarty.now|date_format:"%Y"}
        <a href="http://www.neobill.net">NeoBill</a>.
        
    </footer>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
