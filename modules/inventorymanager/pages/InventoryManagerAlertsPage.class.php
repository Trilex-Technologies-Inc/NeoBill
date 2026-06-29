<?php
require_once BASE_PATH . "modules/inventorymanager/pages/InventoryManagerAdminPage.class.php";

class InventoryManagerAlertsPage extends InventoryManagerAdminPage {
	function init() {
		parent::init();
		$this->smarty->assign( "alerts", $this->rows(
				"select i.id, i.sku, i.name, i.reorder_threshold, coalesce(sum(s.quantity),0) as total_quantity " .
				"from inventorymanager_item i left join inventorymanager_stock s on s.itemid = i.id " .
				"where i.status = 'active' and i.reorder_threshold > 0 " .
				"group by i.id having total_quantity <= i.reorder_threshold order by total_quantity asc, i.sku" ) );
	}
}
?>
