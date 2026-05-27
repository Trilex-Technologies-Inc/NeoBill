<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>NeoBill Manager - {$location|capitalize}</title>

    {* Base styles *}
    <link rel="stylesheet" type="text/css" href="./style.css" />
    <link rel="shortcut icon" type="image/png" href="./vendor/flexy/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="./vendor/flexy/assets/libs/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./vendor/flexy/assets/css/icons/tabler-icons/tabler-icons.css" />
    <link rel="stylesheet" href="./vendor/flexy/assets/css/styles.min.css" />

    {* Legacy UI (some pages rely on jQuery UI widgets) *}
    <link rel="stylesheet" href="./css/jquery.ui.all.css" />
    <script src="./js/jquery-1.7.js"></script>
    <script src="./js/jquery.ui.core.js"></script>
    <script src="./js/jquery.ui.widget.js"></script>
    <script src="./js/jquery.ui.position.js"></script>
    <script src="./js/jquery.ui.button.js"></script>
    <script src="./js/jquery.ui.menu.js"></script>
    <script src="./js/jquery.ui.menubar.js"></script>
    <script src="./js/jquery.ui.tabs.js"></script>
    <script src="./js/jquery.ui.menuitem.js"></script>
    <script src="./js/manager_custom.js"></script>
  </head>

  {if isset( $jsFunction )}
    <body class="sb-nav-fixed" onLoad="{$jsFunction}">
  {else}
    <body class="sb-nav-fixed">
  {/if}

    {include file="$header_template"}

    {if isset($username) && $username != ""}
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4 pt-4">

            {* Display any error/messages *}
            {capture assign="_page_errors_html"}{page_errors}{/capture}
            {capture assign="_page_messages_html"}{page_messages}{/capture}
            {if trim($_page_errors_html) != "" || trim($_page_messages_html) != ""}
              {if trim($_page_errors_html) != ""}
                <div class="alert alert-danger py-2 mb-3 manager_error" role="alert">{$_page_errors_html}</div>
              {/if}
              {if trim($_page_messages_html) != ""}
                <div class="alert alert-info py-2 mb-3 manager_error" role="status">{$_page_messages_html}</div>
              {/if}
            {/if}

            {* Page content *}
            {include file="$content_template"}
          </div>
        </main>

        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4">
            <div class="d-flex align-items-center justify-content-between small">
              <div class="text-muted">NeoBill Manager</div>
            </div>
          </div>
        </footer>
      </div>
    </div>
    {else}
      <div class="container-fluid py-4">
        {include file="$content_template"}
      </div>
    {/if}

    <script src="./vendor/flexy/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./js/manager_layout.js"></script>
  </body>
</html>
