create table if not exists `inventorymanager_item` (
  `id` int(11) not null auto_increment,
  `sku` varchar(64) not null default '',
  `name` varchar(255) not null default '',
  `description` mediumtext,
  `item_type` enum('physical','service','variant','bundle') not null default 'physical',
  `parent_itemid` int(11) default null,
  `reorder_threshold` int(11) not null default '0',
  `status` enum('active','archived') not null default 'active',
  `created` datetime not null default '0000-00-00 00:00:00',
  primary key (`id`),
  unique key `sku` (`sku`),
  key `parent_itemid` (`parent_itemid`)
) default charset=utf8;

create table if not exists `inventorymanager_location` (
  `id` int(11) not null auto_increment,
  `name` varchar(255) not null default '',
  `location_type` enum('warehouse','storefront','virtual') not null default 'warehouse',
  `status` enum('active','archived') not null default 'active',
  `created` datetime not null default '0000-00-00 00:00:00',
  primary key (`id`)
) default charset=utf8;

create table if not exists `inventorymanager_stock` (
  `id` int(11) not null auto_increment,
  `itemid` int(11) not null default '0',
  `locationid` int(11) not null default '0',
  `quantity` int(11) not null default '0',
  `updated` datetime not null default '0000-00-00 00:00:00',
  primary key (`id`),
  unique key `item_location` (`itemid`,`locationid`),
  key `locationid` (`locationid`)
) default charset=utf8;

create table if not exists `inventorymanager_bundle_component` (
  `id` int(11) not null auto_increment,
  `bundle_itemid` int(11) not null default '0',
  `component_itemid` int(11) not null default '0',
  `quantity` int(11) not null default '1',
  primary key (`id`),
  key `bundle_itemid` (`bundle_itemid`),
  key `component_itemid` (`component_itemid`)
) default charset=utf8;

create table if not exists `inventorymanager_movement` (
  `id` int(11) not null auto_increment,
  `itemid` int(11) not null default '0',
  `locationid` int(11) not null default '0',
  `quantity_change` int(11) not null default '0',
  `reference_type` varchar(64) not null default 'manual',
  `reference_id` int(11) default null,
  `note` varchar(255) default null,
  `created` datetime not null default '0000-00-00 00:00:00',
  primary key (`id`),
  key `itemid` (`itemid`),
  key `locationid` (`locationid`),
  key `reference` (`reference_type`,`reference_id`)
) default charset=utf8;

create table if not exists `inventorymanager_product_map` (
  `id` int(11) not null auto_increment,
  `productid` int(11) not null default '0',
  `itemid` int(11) not null default '0',
  `locationid` int(11) default null,
  `quantity` int(11) not null default '1',
  primary key (`id`),
  unique key `product_item_location` (`productid`,`itemid`,`locationid`),
  key `itemid` (`itemid`),
  key `locationid` (`locationid`)
) default charset=utf8;

insert into `inventorymanager_location` (`name`, `location_type`, `status`, `created`)
select 'Default', 'warehouse', 'active', now()
from dual
where not exists (select 1 from `inventorymanager_location` limit 1);
