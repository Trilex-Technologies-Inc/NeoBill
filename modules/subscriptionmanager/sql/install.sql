create table if not exists `subscriptionmanager_plan` (
  `id` int(11) not null auto_increment,
  `name` varchar(255) not null default '',
  `description` mediumtext,
  `status` enum('active','archived') not null default 'active',
  `created` datetime not null default '0000-00-00 00:00:00',
  primary key (`id`)
) default charset=utf8;

create table if not exists `subscriptionmanager_price` (
  `id` int(11) not null auto_increment,
  `planid` int(11) not null default '0',
  `billing_type` enum('fixed','usage') not null default 'fixed',
  `billing_cycle` enum('daily','weekly','monthly','annually') not null default 'monthly',
  `cycle_interval` int(10) unsigned not null default '1',
  `amount` decimal(20,2) not null default '0.00',
  `included_quantity` decimal(20,4) not null default '0.0000',
  `unit_amount` decimal(20,4) not null default '0.0000',
  `trial_days` int(10) unsigned not null default '0',
  `intro_amount` decimal(20,2) default null,
  `intro_cycles` int(10) unsigned not null default '0',
  `taxable` enum('Yes','No') not null default 'No',
  primary key (`id`),
  key `planid` (`planid`)
) default charset=utf8;

create table if not exists `subscriptionmanager_subscription` (
  `id` int(11) not null auto_increment,
  `accountid` int(11) not null default '0',
  `planid` int(11) not null default '0',
  `priceid` int(11) not null default '0',
  `status` enum('trialing','active','past_due','paused','cancelled','expired') not null default 'active',
  `quantity` int(11) not null default '1',
  `current_period_start` datetime not null default '0000-00-00 00:00:00',
  `current_period_end` datetime not null default '0000-00-00 00:00:00',
  `trial_end` datetime default null,
  `intro_cycles_remaining` int(10) unsigned not null default '0',
  `cancel_at` datetime default null,
  `cancelled_at` datetime default null,
  `nextbillingdate` date default null,
  `previnvoiceid` int(11) default null,
  `sourcepurchaseid` int(11) default null,
  `billing_type` enum('fixed','usage') default null,
  `billing_cycle` enum('daily','weekly','monthly','annually') default null,
  `cycle_interval` int(10) unsigned default null,
  `amount` decimal(20,2) default null,
  `included_quantity` decimal(20,4) default null,
  `unit_amount` decimal(20,4) default null,
  `intro_amount` decimal(20,2) default null,
  `taxable` enum('Yes','No') default null,
  `created` datetime not null default '0000-00-00 00:00:00',
  `updated` datetime not null default '0000-00-00 00:00:00',
  primary key (`id`),
  key `accountid` (`accountid`),
  key `nextbillingdate` (`nextbillingdate`),
  key `sourcepurchaseid` (`sourcepurchaseid`)
) default charset=utf8;

create table if not exists `subscriptionmanager_usage` (
  `id` int(11) not null auto_increment,
  `subscriptionid` int(11) not null default '0',
  `usage_date` datetime not null default '0000-00-00 00:00:00',
  `quantity` decimal(20,4) not null default '0.0000',
  `description` varchar(255) default null,
  `invoiceid` int(11) default null,
  primary key (`id`),
  key `subscriptionid` (`subscriptionid`),
  key `invoiceid` (`invoiceid`)
) default charset=utf8;

create table if not exists `subscriptionmanager_change` (
  `id` int(11) not null auto_increment,
  `subscriptionid` int(11) not null default '0',
  `old_priceid` int(11) default null,
  `new_priceid` int(11) default null,
  `change_type` enum('upgrade','downgrade','cancel','reactivate','quantity') not null default 'upgrade',
  `effective_date` datetime not null default '0000-00-00 00:00:00',
  `proration_amount` decimal(20,2) not null default '0.00',
  `invoiceid` int(11) default null,
  primary key (`id`),
  key `subscriptionid` (`subscriptionid`)
) default charset=utf8;

create table if not exists `subscriptionmanager_promo_code` (
  `id` int(11) not null auto_increment,
  `code` varchar(64) not null default '',
  `discount_type` enum('percent','fixed') not null default 'percent',
  `discount_value` decimal(20,4) not null default '0.0000',
  `duration` enum('once','repeating','forever') not null default 'once',
  `duration_cycles` int(10) unsigned not null default '0',
  `max_redemptions` int(10) unsigned default null,
  `redeemed_count` int(10) unsigned not null default '0',
  `expires_at` datetime default null,
  `status` enum('active','inactive') not null default 'active',
  primary key (`id`),
  unique key `code` (`code`)
) default charset=utf8;

create table if not exists `subscriptionmanager_discount` (
  `id` int(11) not null auto_increment,
  `subscriptionid` int(11) not null default '0',
  `promocodeid` int(11) default null,
  `discount_type` enum('percent','fixed') not null default 'percent',
  `discount_value` decimal(20,4) not null default '0.0000',
  `remaining_cycles` int(10) unsigned default null,
  `expires_at` datetime default null,
  `status` enum('active','expired') not null default 'active',
  primary key (`id`),
  key `subscriptionid` (`subscriptionid`)
) default charset=utf8;

create table if not exists `subscriptionmanager_dunning_attempt` (
  `id` int(11) not null auto_increment,
  `subscriptionid` int(11) not null default '0',
  `invoiceid` int(11) default null,
  `paymentid` int(11) default null,
  `attempt_number` int(10) unsigned not null default '1',
  `status` enum('scheduled','failed','succeeded','cancelled') not null default 'scheduled',
  `scheduled_at` datetime not null default '0000-00-00 00:00:00',
  `attempted_at` datetime default null,
  `message` varchar(255) default null,
  primary key (`id`),
  key `subscriptionid` (`subscriptionid`),
  key `invoiceid` (`invoiceid`)
) default charset=utf8;

create table if not exists `subscriptionmanager_payment_method` (
  `id` int(11) not null auto_increment,
  `accountid` int(11) not null default '0',
  `gateway_module` varchar(255) not null default '',
  `gateway_customer_token` varchar(255) default null,
  `gateway_payment_token` varchar(255) default null,
  `card_brand` varchar(32) default null,
  `card_last4` varchar(4) default null,
  `card_exp_month` int(2) default null,
  `card_exp_year` int(4) default null,
  `status` enum('active','expired','removed') not null default 'active',
  `created` datetime not null default '0000-00-00 00:00:00',
  primary key (`id`),
  key `accountid` (`accountid`)
) default charset=utf8;

create table if not exists `subscriptionmanager_product_map` (
  `id` int(11) not null auto_increment,
  `productid` int(11) not null default '0',
  `planid` int(11) not null default '0',
  `priceid` int(11) not null default '0',
  `quantity` int(11) not null default '1',
  primary key (`id`),
  unique key `productid` (`productid`),
  key `planid` (`planid`),
  key `priceid` (`priceid`)
) default charset=utf8;

create table if not exists `subscriptionmanager_billing_period` (
  `id` int(11) not null auto_increment,
  `subscriptionid` int(11) not null default '0',
  `period_start` datetime not null default '0000-00-00 00:00:00',
  `period_end` datetime not null default '0000-00-00 00:00:00',
  `invoiceid` int(11) default null,
  `status` enum('processing','invoiced','no_charge','failed') not null default 'processing',
  `created` datetime not null default '0000-00-00 00:00:00',
  `updated` datetime not null default '0000-00-00 00:00:00',
  primary key (`id`),
  unique key `subscription_period` (`subscriptionid`,`period_start`),
  key `invoiceid` (`invoiceid`)
) default charset=utf8;
