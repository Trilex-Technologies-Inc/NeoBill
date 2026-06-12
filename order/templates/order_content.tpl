<!DOCTYPE html>
<html lang="en">
<head>
    <title>{$order_title}</title>
    <meta charset="utf-8">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Existing stylesheet -->
    <link rel="stylesheet" type="text/css" href="coffee.css" media="screen"/>
</head>

<body class="bg-light">

<div class="container py-4">

    {* Include page header *}
    {include file="order_header.tpl"}

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark rounded mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">{$order_title}</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="mainNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Domains</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Support</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="card shadow-sm">
        <div class="card-body">

            <div class="mb-3">
                {if $username == null && !$supressWelcome}
                    <a href="index.php?page=customerlogin" class="btn btn-primary">
                        {echo phrase="SIGN IN"}
                    </a>

                {elseif $username == " "}

                {elseif isset($username) && !$supressWelcome}
                    <div class="alert alert-success mb-0">
                        {echo phrase="WELCOME_BACK"}, {$username}!
                        |
                        <a href="index.php?page=customerlogin&op=logout">
                            Logout
                        </a>
                    </div>
                {/if}
            </div>

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

    <footer class="text-center text-muted mt-4 small">
        &copy; 2011
        <a href="http://www.neobill.net">NeoBill</a>.
        Template design by
        <a href="http://templates.arcsin.se">Arcsin</a>
    </footer>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>