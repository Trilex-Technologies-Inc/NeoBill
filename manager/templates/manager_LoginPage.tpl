<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">



<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">


  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title>NeoBill Manager - {$location|capitalize}</title>
    <link rel="stylesheet" type="text/css" href="./style.css" /> 
    <link rel="shortcut icon" type="image/png" href="./vendor/flexy/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="./vendor/flexy/assets/css/styles.min.css" />
    <link rel="stylesheet" type="text/css" href="./css/demos.css" />
    <script src="./js/jquery-1.7.js"></script>
	<script src="./js/jquery.ui.core.js"></script>
	<script src="./js/jquery.ui.widget.js"></script>
	<script src="./js/jquery.ui.position.js"></script>
	<script src="./js/jquery.ui.button.js"></script>

	<script src="./js/jquery.ui.menu.js"></script>

	<script src="./js/jquery.ui.menubar.js"></script>

    <script src="./js/jquery.ui.menuitem.js"></script>

	<link rel="stylesheet" href="./css/jquery.ui.all.css" /> 

  </head>


  <body class="bootstrap-layout manager-login-page">
    {capture assign="_page_errors_html"}{page_errors}{/capture}
    <main class="manager-login-shell">
      <section class="manager-login-panel" aria-labelledby="manager-login-title">
        <div class="manager-login-intro">
          <a href="index.php" class="manager-login-logo" aria-label="NeoBill home">
            <img src="images/logo.gif" alt="NeoBill" />
          </a>

          <div class="manager-login-intro-copy">
            <div class="manager-login-kicker">Manager Console</div>
            <h1 id="manager-login-title">NeoBill {echo phrase="LOGIN"}</h1>
            <p>Access accounts, billing, domains, services, and administrative tools from one secure workspace.</p>

            <div class="manager-login-highlights" aria-label="Manager features">
              <span><i class="ti ti-users"></i> Accounts</span>
              <span><i class="ti ti-receipt"></i> Billing</span>
              <span><i class="ti ti-world"></i> Domains</span>
            </div>
          </div>
        </div>

        <div class="manager-login-card">
          {if trim($_page_errors_html) != ""}
            <div class="alert alert-danger manager-login-alert" role="alert">{$_page_errors_html}</div>
          {/if}

      {form name="login"}  
        <div class="manager-login-form-header">
          <div class="manager-login-lock"><i class="ti ti-lock"></i></div>
          <div>
            <h2>Welcome back</h2>
            <p>Sign in to continue to NeoBill Manager.</p>
          </div>
        </div>

        <div class="manager-login-field">
          <label class="form-label">{echo phrase="USERNAME"}</label>
          <div class="manager-login-input">
            <i class="ti ti-user"></i>
            {form_element field="username" size="30" class="form-control" autocomplete="username"}
          </div>
        </div>

        <div class="manager-login-field">
          <label class="form-label">{echo phrase="PASSWORD"}</label>
          <div class="manager-login-input">
            <i class="ti ti-key"></i>
            {form_element field="password" size="30" class="form-control" autocomplete="current-password"}
          </div>
        </div>

        <div class="manager-login-field">
          <label class="form-label">[THEME]</label>
          <div class="manager-login-input manager-login-select">
            <i class="ti ti-palette"></i>
            {form_element field="theme" class="form-select"}
          </div>
        </div>

        <div class="manager-login-actions">{form_element field="continue" class="btn btn-primary"}</div>

      {/form}
        </div>
      </section>
    </main>
    <script src="./vendor/flexy/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
