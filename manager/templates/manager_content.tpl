<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>{$company_name} - Manager Interface</title>
    <link rel="stylesheet" type="text/css" href="./style.css" />  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="js/jquery-1.7.js"></script>
	<script src="js/jquery.ui.core.js"></script>
	<script src="js/jquery.ui.widget.js"></script>
	<script src="js/jquery.ui.position.js"></script>
	<script src="js/jquery.ui.button.js"></script>
	<script src="js/jquery.ui.menu.js"></script>

	<script src="js/jquery.ui.menubar.js"></script>

	<script src="js/jquery.ui.tabs.js"></script>

    <script src="js/jquery.ui.menuitem.js"></script>

    <script src="js/manager_custom.js"></script>
    <link rel="stylesheet" href="css/demos.css" type="text/css" />

	<link rel="stylesheet" href="css/jquery.ui.all.css" />

	<link rel="stylesheet" href="css/demos.css" />

	

  </head>



  {if isset( $jsFunction )}

    <body class="bootstrap-layout" onLoad="{$jsFunction}">

  {else}

    <body class="bootstrap-layout">

  {/if}

 
    {include file="$header_template"}
    <div class="clearfix"></div>

      {* Display any error messages *}
      {capture assign="_page_errors_html"}{page_errors}{/capture}
      {capture assign="_page_messages_html"}{page_messages}{/capture}
      {if trim($_page_errors_html) != "" || trim($_page_messages_html) != ""}
        <div class="container mt-3">
          {if trim($_page_errors_html) != ""}
            <div class="alert alert-danger py-2 mb-2 manager_error" role="alert">{$_page_errors_html}</div>
          {/if}
          {if trim($_page_messages_html) != ""}
            <div class="alert alert-info py-2 mb-3 manager_error" role="status">{$_page_messages_html}</div>
          {/if}
        </div>
      {/if}

      <main class="container my-4">
        {* Include the page content *}
        {include file="$content_template"}
      </main>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


  </body>

</html>
