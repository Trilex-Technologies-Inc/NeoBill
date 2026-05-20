<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <title>NeoBill Manager - {$location|capitalize}</title>
    <link rel="stylesheet" type="text/css" href="./style.css" /> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
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

  <body class="bootstrap-layout">
{include file="$header_template"}
    <div class="clearfix"></div>
    {capture assign="_page_errors_html"}{page_errors}{/capture}
    {if trim($_page_errors_html) != ""}
      <div class="container mt-3">
        <div class="alert alert-danger py-2 mb-0" role="alert">{$_page_errors_html}</div>
      </div>
    {/if}
    <main class="container my-5">
      <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-6 col-lg-5">
          <div class="card shadow-sm">
            <div class="card-body p-4">

      {form name="login"}  
        <h1 class="h4 mb-4 text-center">NeoBill {echo phrase="LOGIN"}</h1>

        <div class="mb-3">
          <label class="form-label">{echo phrase="USERNAME"}</label>
          {form_element field="username" size="30" class="form-control" autocomplete="username"}
        </div>

        <div class="mb-3">
          <label class="form-label">{echo phrase="PASSWORD"}</label>
          {form_element field="password" size="30" class="form-control" autocomplete="current-password"}
        </div>

        <div class="mb-3">
          <label class="form-label">[THEME]</label>
          {form_element field="theme" class="form-select"}
        </div>

        <div class="d-grid mt-4">{form_element field="continue" class="btn btn-primary"}</div>

      {/form}
            </div>
          </div>
        </div>
      </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  </body>
</html>
