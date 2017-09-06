alter table store
add FOREIGN KEY (`station_id`)
REFERENCES `db_vphan`.`Station` (`station_id`);

Alter table item
add FOREIGN KEY (`department_id`)
REFERENCES `db_vphan`.`Department` (`department_id`);

alter table inventory
add FOREIGN KEY (`store_id`)
REFERENCES `db_vphan`.`Store` (`store_id`);

alter table inventory
add FOREIGN KEY (`item_id`)
REFERENCES `db_vphan`.`Item` (`item_id`);

alter table sale
add FOREIGN KEY (`store_id`)
REFERENCES `db_vphan`.`Store` (`store_id`);

alter table `weather event`
add FOREIGN KEY (`station_id`)
REFERENCES `db_vphan`.`Station` (`station_id`);

alter table `line_item`
add FOREIGN KEY (`sale_id`)
REFERENCES `db_vphan`.`Sale` (`sale_id`);

alter table `line_item`
add FOREIGN KEY (`item_id`)
REFERENCES `db_vphan`.`Item` (`item_id`);