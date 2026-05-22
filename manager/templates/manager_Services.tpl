<div class="manager_content">

<h2 class="mb-4">{echo phrase="PRODUCTS_SERVICES_SUMMARY"}</h2>

<div class="properties">

  <div class="row g-3">
    
    <!-- Web Hosting Services Card -->
    <div class="col-md-4">
      <div class="card border-primary h-100">
        <div class="card-header bg-primary text-white">
          <h3 class="h6 mb-0">{echo phrase="WEB_HOSTING_SERVICES"}</h3>
        </div>
        <div class="card-body text-center">
          <div class="display-4 fw-bold mb-3">
            <a href="manager_content.php?page=services_web_hosting" class="text-decoration-none">{$services_count}</a>
          </div>
          <div class="mt-2">
            <a href="manager_content.php?page=services_new_hosting" class="btn btn-outline-primary btn-sm">
              &raquo; {echo phrase="NEW_HOSTING_SERVICE"}
            </a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Domain Services Card -->
    <div class="col-md-4">
      <div class="card border-success h-100">
        <div class="card-header bg-success text-white">
          <h3 class="h6 mb-0">{echo phrase="DOMAIN_SERVICES"}</h3>
        </div>
        <div class="card-body text-center">
          <div class="display-4 fw-bold mb-3">
            <a href="manager_content.php?page=services_domain_services" class="text-decoration-none">{$domain_services_count}</a>
          </div>
          <div class="mt-2">
            <a href="manager_content.php?page=services_new_domain_service" class="btn btn-outline-success btn-sm">
              &raquo; {echo phrase="NEW_DOMAIN_SERVICE"}
            </a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Products Card -->
    <div class="col-md-4">
      <div class="card border-info h-100">
        <div class="card-header bg-info text-white">
          <h3 class="h6 mb-0">{echo phrase="PRODUCTS"}</h3>
        </div>
        <div class="card-body text-center">
          <div class="display-4 fw-bold mb-3">
            <a href="manager_content.php?page=services_products" class="text-decoration-none">{$products_count}</a>
          </div>
          <div class="mt-2">
            <a href="manager_content.php?page=services_new_product" class="btn btn-outline-info btn-sm">
              &raquo; {echo phrase="NEW_PRODUCT"}
            </a>
          </div>
        </div>
      </div>
    </div>
    
  </div>

</div>

</div>