<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>{$company_name} - Manager Interface</title>
    <link rel="stylesheet" type="text/css" href="./style.css" />  
    <link rel="shortcut icon" type="image/png" href="./vendor/flexy/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="./vendor/flexy/assets/css/styles.min.css" />
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

 
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6"
      data-sidebartype="full" data-sidebar-position="fixed" data-header-position="fixed">
      {include file="$header_template"}
      {if isset($username) && $username != ""}
      <div class="body-wrapper">
        <header class="app-header">
          <nav class="navbar navbar-expand-lg navbar-light">
            <div class="navbar-collapse justify-content-end px-0">
              <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                <li class="nav-item dropdown">
                  <a class="nav-link" href="javascript:void(0)" id="nbUserMenu" data-bs-toggle="dropdown" aria-expanded="false">
                    <span class="fw-semibold">{$username}</span>
                  </a>
                  <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="nbUserMenu">
                    <div class="message-body">
                      <a href="manager_content.php?page=home&amp;action=logout" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                    </div>
                  </div>
                </li>
              </ul>
            </div>
          </nav>
        </header>
        <div class="body-wrapper-inner">
          <div class="container-fluid">
      {else}
        <div class="container-fluid py-4">
      {/if}

      {* Display any error messages *}
      {capture assign="_page_errors_html"}{page_errors}{/capture}
      {capture assign="_page_messages_html"}{page_messages}{/capture}
      {if trim($_page_errors_html) != "" || trim($_page_messages_html) != ""}
        <div class="container-fluid mt-3">
          {if trim($_page_errors_html) != ""}
            <div class="alert alert-danger py-2 mb-2 manager_error" role="alert">{$_page_errors_html}</div>
          {/if}
          {if trim($_page_messages_html) != ""}
            <div class="alert alert-info py-2 mb-3 manager_error" role="status">{$_page_messages_html}</div>
          {/if}
        </div>
      {/if}

        {* Include the page content *}
        {include file="$content_template"}

      {if isset($username) && $username != ""}
          </div>
        </div>
      </div>
      {else}
        </div>
      {/if}

    </div>

    <script src="./vendor/flexy/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
