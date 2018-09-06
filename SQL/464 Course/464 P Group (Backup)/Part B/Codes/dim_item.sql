drop table if exists dim_item;
create table dim_item as
select item.*,department_name
from item, department
where item.department_id=department.department_id;

Alter table dim_item
add column item_key int not null auto_increment,
add primary key (`item_key`);

select * from dim_item;