<div class="manager_content log-page">
  <div class="log-shell">
    <div class="log-header">
      <div class="log-title">
        <span class="log-icon"><i class="ti ti-list-search"></i></span>
        <div>
          <span class="log-kicker">{echo phrase="MODULES"}</span>
          <h2>{echo phrase="SOLIDSTATE_LOG"}</h2>
          <p>{echo phrase="LOG_ENTRIES"}</p>
        </div>
      </div>
    </div>

    <div class="log-table-card">
      <div class="log-table-header">
        <div>
          <span>{echo phrase="LOG"}</span>
          <h3>{echo phrase="LOG_ENTRIES"}</h3>
        </div>
        <div class="log-sort-note">
          <i class="ti ti-sort-descending"></i>
          {echo phrase="DATE"}
        </div>
      </div>

      <div class="table-responsive log-table-wrap">
        {form name="log"}
          {form_table field="log" class="table table-sm table-hover align-middle mb-0"}

            {form_table_column columnid="id" header="[ID]"}
              <a href="manager_content.php?page=view_log_message&log={$log.id}" class="log-id">#{$log.id}</a>
            {/form_table_column}

            {form_table_column columnid="type" header="[TYPE]"}
              <span class="log-type">{$log.type}</span>
            {/form_table_column}

            {form_table_column columnid="message" header="[MESSAGE]"}
              <span class="log-message">{$log.text}</span>
            {/form_table_column}

            {form_table_column columnid="username" header="[USER]"}
              <span class="log-user">{$log.username}</span>
            {/form_table_column}

            {form_table_column columnid="ip" header="[IP]"}
              <span class="log-ip">{$log.ip}</span>
            {/form_table_column}

            {form_table_column columnid="date" header="[DATE]"}
              <span class="log-date">{$log.date|datetime}</span>
            {/form_table_column}

          {/form_table}
        {/form}
      </div>
    </div>
  </div>
</div>
