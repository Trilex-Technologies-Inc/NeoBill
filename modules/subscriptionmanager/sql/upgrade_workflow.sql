-- Subscription Manager workflow upgrade for existing installations.
--
-- Run this file once after backing up the database. It targets the schema that
-- existed before subscription contract snapshots and billing-period claims.

alter table `subscriptionmanager_subscription`
  add column `sourcepurchaseid` int(11) default null after `previnvoiceid`,
  add column `billing_type` enum('fixed','usage') default null after `sourcepurchaseid`,
  add column `billing_cycle` enum('daily','weekly','monthly','annually') default null after `billing_type`,
  add column `cycle_interval` int(10) unsigned default null after `billing_cycle`,
  add column `amount` decimal(20,2) default null after `cycle_interval`,
  add column `included_quantity` decimal(20,4) default null after `amount`,
  add column `unit_amount` decimal(20,4) default null after `included_quantity`,
  add column `intro_amount` decimal(20,2) default null after `unit_amount`,
  add column `taxable` enum('Yes','No') default null after `intro_amount`,
  add key `sourcepurchaseid` (`sourcepurchaseid`);

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

-- Freeze the current contract terms for subscriptions that predate this
-- upgrade. Subsequent plan edits will no longer change these subscriptions.
update `subscriptionmanager_subscription` s
join `subscriptionmanager_price` p on p.id = s.priceid
set s.billing_type = p.billing_type,
    s.billing_cycle = p.billing_cycle,
    s.cycle_interval = p.cycle_interval,
    s.amount = p.amount,
    s.included_quantity = p.included_quantity,
    s.unit_amount = p.unit_amount,
    s.intro_amount = p.intro_amount,
    s.taxable = p.taxable
where s.billing_type is null
   or s.billing_cycle is null
   or s.cycle_interval is null
   or s.amount is null
   or s.included_quantity is null
   or s.unit_amount is null
   or s.taxable is null;

