<h2 class="mb-3">{echo phrase="DOMAINS_SUMMARY"}</h2>

<!-- Search Section -->
<div class="search mb-4">
  <div class="card">
    <div class="card-body">
      {form name="search_domaindbo_table"}
        <div class="row align-items-end g-3">
          <div class="col-md-5">
            <label class="form-label fw-bold">{echo phrase="DOMAIN_NAME"}</label>
            {form_description field="domainname"}
            {form_element field="domainname" class="form-control"}
          </div>
          <div class="col-md-5">
            <label class="form-label fw-bold">{echo phrase="TLD"}</label>
            {form_description field="tld"}
            {form_element field="tld" class="form-control"}
          </div>
          <div class="col-md-2">
            {form_element field="search" class="btn btn-primary w-100"}
          </div>
        </div>
      {/form}
    </div>
  </div>
</div>

<!-- Summary Section -->
<div class="properties">
  <div class="row g-3">
    
    <!-- Active Domains Card -->
    <div class="col-md-6">
      <div class="card border-primary h-100">
        <div class="card-header bg-primary text-white">
          <h3 class="h6 mb-0">{echo phrase="ACTIVE_DOMAINS"}</h3>
        </div>
        <div class="card-body text-center">
          <div class="display-4 fw-bold mb-2">
            <a href="manager_content.php?page=domains_browse" class="text-decoration-none">{$domains_count}</a>
          </div>
          <div class="mt-3">
            <span class="text-muted">Domain management is disabled.</span>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Expired Domains Card -->
    <div class="col-md-6">
      <div class="card border-warning h-100">
        <div class="card-header bg-warning text-dark">
          <h3 class="h6 mb-0">{echo phrase="EXPIRED_DOMAINS"}</h3>
        </div>
        <div class="card-body text-center">
          <div class="display-4 fw-bold mb-2">
            <a href="manager_content.php?page=domains_expired" class="text-decoration-none">{$expired_domains_count}</a>
          </div>
        </div>
      </div>
    </div>
    
  </div>
</div>
