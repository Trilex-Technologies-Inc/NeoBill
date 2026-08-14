<div class="manager_content">
  <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 mb-3">
    <h2 class="h4 mb-0">{echo phrase="ACCOUNTS_SUMMARY"}</h2>
    <a class="btn btn-sm btn-primary" href="manager_content.php?page=accounts_new_account">{echo phrase="CREATE_NEW_ACCOUNT"}</a>
  </div>

  <div class="list-group">
    <a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" href="manager_content.php?page=accounts_browse">
      <span>{echo phrase="ACTIVE_ACCOUNTS"}</span>
      <span class="badge text-bg-secondary rounded-pill">{$active_accounts_count}</span>
    </a>
    <a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" href="manager_content.php?page=accounts_browse_inactive">
      <span>{echo phrase="INACTIVE_ACCOUNTS"}</span>
      <span class="badge text-bg-secondary rounded-pill">{$inactive_accounts_count}</span>
    </a>
    <div class="list-group-item d-flex justify-content-between align-items-center">
      <span>{echo phrase="ALL_ACCOUNTS"}</span>
      <span class="badge text-bg-secondary rounded-pill">{$total_accounts}</span>
    </div>
    <a class="list-group-item list-group-item-action d-flex justify-content-between align-items-center" href="manager_content.php?page=accounts_browse_pending">
      <span>{echo phrase="PENDING_ACCOUNTS"}</span>
      <span class="badge text-bg-secondary rounded-pill">{$pending_accounts_count}</span>
    </a>
  </div>
</div>
