<div class="order-my-products-page">
  <div class="d-flex justify-content-between align-items-start gap-3 mb-4">
    <div>
      <span class="order-kicker">Account</span>
      <h2 class="mb-1">My Products</h2>
      <p class="text-muted mb-0">{$myProductsCount} product purchase(s) attached to your account.</p>
    </div>
    <a href="index.php?page=purchaseproduct" class="btn btn-outline-primary order-register-button">Register Product</a>
  </div>

  {if $myProductsCount > 0}
    <div class="table-responsive">
      <table class="table table-hover align-middle mb-0 order-products-table">
        <thead>
          <tr>
            <th>Product</th>
            <th>Term</th>
            <th>Purchase Date</th>
            <th>Next Billing Date</th>
          </tr>
        </thead>
        <tbody>
          {foreach from=$myProducts item=product}
            <tr>
              <td>
                <strong>{$product.name}</strong>
                {if $product.description != ""}
                  <span>{$product.description}</span>
                {/if}
              </td>
              <td>
                {if $product.term != 0 && $product.term != ""}
                  {$product.term} months
                {else}
                  N/A
                {/if}
              </td>
              <td>{$product.date|datetime:date}</td>
              <td>{$product.nextbillingdate|datetime:date}</td>
            </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
  {else}
    <div class="order-empty-state">
      <h3>No products yet</h3>
      <p>Your purchased products will appear here after they are added to your account.</p>
      <a href="index.php?page=purchaseproduct" class="btn btn-primary order-login-button">Register Product</a>
    </div>
  {/if}
</div>
