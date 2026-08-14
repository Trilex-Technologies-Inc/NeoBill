<div class="card mb-4">
  <div class="card-header"><h5 class="mb-0">Email verification</h5></div>
  <div class="card-body">
    {if $verification_success}
      <div class="alert alert-success">Your email has been verified and your account is now active.</div>
      <a class="btn btn-primary" href="index.php?page=cart">Continue</a>
    {else}
      <div class="alert alert-danger">This verification link is invalid, expired, or has already been used.</div>
      <a class="btn btn-outline-primary" href="index.php?page=customerlogin">Go to login</a>
    {/if}
  </div>
</div>
