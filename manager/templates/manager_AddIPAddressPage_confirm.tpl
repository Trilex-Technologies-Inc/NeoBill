<div class="manager_content">
    <h2>{echo phrase="CONFIRM_IP"} {dbo_echo dbo="server_dbo" field="hostname"}</h2>

    <div class="properties">
        {form name="add_ip_confirm"}
        
        <div class="card">
            <div class="card-body">
                <!-- Beginning Address -->
                <div class="row mb-3">
                    <div class="col-sm-4 col-md-3 fw-bold">
                        {echo phrase="BEGINNING_ADDRESS"}:
                    </div>
                    <div class="col-sm-8 col-md-9">
                        {dbo_echo dbo="begin_ip" field="ipstring"}
                    </div>
                </div>

                <!-- End Address -->
                <div class="row mb-4">
                    <div class="col-sm-4 col-md-3 fw-bold">
                        {echo phrase="END_ADDRESS"}:
                    </div>
                    <div class="col-sm-8 col-md-9">
                        {dbo_echo dbo="end_ip" field="ipstring"}
                    </div>
                </div>

                <!-- Buttons -->
                <div class="row">
                    <div class="col-12">
                        <div class="d-flex gap-2">
                            {form_element field="continue"}
                            {form_element field="cancel"}
                        </div>
                    </div>
                </div>
            </div>
        </div>

        {/form}
    </div>
</div>