<div class="order-my-products-page">
  <div class="order-my-products-hero">
    <div class="order-my-products-title">
      <span class="order-kicker">Account Library</span>
      <h2 class="mb-1">My Products</h2>
      <p>Review every purchased product, billing term, invoice reference, and configured price from one clean view.</p>
    </div>
    <a href="index.php?page=purchaseproduct" class="btn btn-outline-primary order-register-button">Register Product</a>
  </div>

  {if $myProductsCount > 0}
    <div class="order-product-summary-grid">
      <div class="order-product-summary-card">
        <span>Total Products</span>
        <strong>{$myProductsCount}</strong>
      </div>
      <div class="order-product-summary-card">
        <span>Recurring</span>
        <strong>{$myRecurringProductsCount}</strong>
      </div>
      <div class="order-product-summary-card">
        <span>One-time</span>
        <strong>{$myOneTimeProductsCount}</strong>
      </div>
    </div>

    <div class="order-product-detail-list">
      {foreach from=$myProducts item=product}
        <article class="order-product-detail-card">
          <div class="order-product-detail-header">
            <div class="order-product-title-row">
              <span class="order-product-avatar">P</span>
              <div>
                <span class="order-kicker">Product #{$product.productid} · Purchase #{$product.id}</span>
                <h3>{$product.name}</h3>
                {if $product.description != ""}
                  <p>{$product.description}</p>
                {else}
                  <p>No product description has been added yet.</p>
                {/if}
              </div>
            </div>
            <span class="order-product-status {if $product.isrecurring}order-product-status-recurring{else}order-product-status-onetime{/if}">
              {if $product.isrecurring}
                Recurring
              {else}
                One-time
              {/if}
            </span>
          </div>

          <div class="order-product-detail-grid">
            <div class="order-product-detail-item">
              <span>Purchase Date</span>
              <strong>{$product.date|datetime:date}</strong>
            </div>
            <div class="order-product-detail-item">
              <span>Billing Term</span>
              <strong>
                {if $product.isrecurring}
                  {$product.term} months
                {else}
                  N/A
                {/if}
              </strong>
            </div>
            <div class="order-product-detail-item">
              <span>Next Billing Date</span>
              <strong>{$product.nextbillingdate|datetime:date}</strong>
            </div>
            <div class="order-product-detail-item">
              <span>Visibility</span>
              <strong>{$product.public}</strong>
            </div>
            <div class="order-product-detail-item">
              <span>One-time Price</span>
              <strong>
                {if $product.hasonetimeprice}
                  {$product.onetimeprice|currency}
                {else}
                  N/A
                {/if}
              </strong>
            </div>
            <div class="order-product-detail-item">
              <span>Recurring Price</span>
              <strong>
                {if $product.hasrecurringprice}
                  {$product.recurringprice|currency}
                {else}
                  N/A
                {/if}
              </strong>
            </div>
            <div class="order-product-detail-item">
              <span>Previous Invoice</span>
              <strong>
                {if $product.previnvoiceid != "" && $product.previnvoiceid > 0}
                  #{$product.previnvoiceid}
                {else}
                  N/A
                {/if}
              </strong>
            </div>
          </div>

          <div class="order-product-pricing">
            <h4>Available Pricing</h4>
            {if $product.pricing|@count > 0}
              <div class="table-responsive">
                <table class="table table-sm align-middle mb-0 order-products-table">
                  <thead>
                    <tr>
                      <th>Type</th>
                      <th>Term</th>
                      <th>Price</th>
                      <th>Taxable</th>
                    </tr>
                  </thead>
                  <tbody>
                    {foreach from=$product.pricing item=price}
                      <tr>
                        <td>{$price.type}</td>
                        <td>
                          {if $price.term != 0}
                            {$price.term} months
                          {else}
                            N/A
                          {/if}
                        </td>
                        <td>{$price.price|currency}</td>
                        <td>{$price.taxable}</td>
                      </tr>
                    {/foreach}
                  </tbody>
                </table>
              </div>
            {else}
              <p class="order-product-muted">No pricing rows are configured for this product.</p>
            {/if}
          </div>

          {if $product.note != ""}
            <div class="order-product-note">
              <span>Note</span>
              <p>{$product.note}</p>
            </div>
          {/if}
        </article>
      {/foreach}
    </div>
  {else}
    <div class="order-empty-state">
      <h3>No products yet</h3>
      <p>Your purchased products will appear here after they are added to your account.</p>
      <a href="index.php?page=purchaseproduct" class="btn btn-primary order-login-button">Register Product</a>
    </div>
  {/if}
</div>
