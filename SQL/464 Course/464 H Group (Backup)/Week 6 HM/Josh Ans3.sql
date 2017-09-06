#3a
use db_shunkinl;
select ce.stakeholder_id stdid, first_name, last_name, email
from stakeholders s join course_enrollments ce 
right join emails e on ce.stakeholder_id = e.stakeholder_id 
and s.stakeholder_id = ce.stakeholder_id 
where (course_offering_id = 1) and (enrollment_status = 'Waitlist');

#3b
use db_shunkinl;
select first_name, last_name
from stakeholders as s, course_enrollments as ce
where s.stakeholder_id=ce.stakeholder_id
and course_offering_id = 1;

#3c
use db_shunkinl;
select last_name, first_name
from stakeholders  s
left join emails e
on s.stakeholder_id=e.stakeholder_id
where e.stakeholder_id is null;