<div class="manager_content">

  <div class="card">
    <div class="card-header bg-primary text-white">
      <h2 class="h5 mb-0">{echo phrase="VIEW_LOG_MESSAGE"}</h2>
    </div>
    <div class="card-body">
      
      <div class="properties">
        
        <!-- Log Message ID -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="LOG_MESSAGE_ID"}:</div>
          <div class="col-md-8 p-2">
            <span class="fw-bold text-primary">#{dbo_echo dbo="logdbo" field="id"}</span>
          </div>
        </div>
        
        <!-- Type -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="TYPE"}:</div>
          <div class="col-md-8 p-2">
            {assign var="logType" value={dbo_echo dbo="logdbo" field="type"}}
            {if $logType == "Error"}
              <span class="badge bg-danger">{$logType}</span>
            {elseif $logType == "Warning"}
              <span class="badge bg-warning text-dark">{$logType}</span>
            {elseif $logType == "Info"}
              <span class="badge bg-info">{$logType}</span>
            {else}
              <span class="badge bg-secondary">{$logType}</span>
            {/if}
          </div>
        </div>
        
        <!-- Module -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="MODULE"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-secondary">{dbo_echo dbo="logdbo" field="module"}</span>
          </div>
        </div>
        
        <!-- Message -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="MESSAGE"}:</div>
          <div class="col-md-8 p-2">
            <div class="alert alert-secondary mb-0">
              <code class="text-wrap">{dbo_echo dbo="logdbo" field="text"}</code>
            </div>
          </div>
        </div>
        
        <!-- Username -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="USERNAME"}:</div>
          <div class="col-md-8 p-2">
            <span class="fw-bold">{dbo_echo dbo="logdbo" field="username"}</span>
          </div>
        </div>
        
        <!-- Remote IP Address -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="REMOTE_IP_ADDRESS"}:</div>
          <div class="col-md-8 p-2">
            <code>{dbo_echo dbo="logdbo" field="remoteipstring"}</code>
          </div>
        </div>
        
        <!-- Date -->
        <div class="row mb-3">
          <div class="col-md-4 fw-bold bg-light p-2 rounded">{echo phrase="DATE"}:</div>
          <div class="col-md-8 p-2">
            <span class="badge bg-info">{dbo_echo|datetime dbo="logdbo" field="date"}</span>
          </div>
        </div>
        
      </div>
      
    </div>
    <div class="card-footer">
      {form name="view_log_message"}
        {form_element field="back" class="btn btn-secondary"}
      {/form}
    </div>
  </div>

</div>