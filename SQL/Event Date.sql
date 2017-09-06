
select id, eventDate, startTime, endTime from Event_2000.Events
union all
select id, eventDate, startTime, endTime from Event_2002.Events;

