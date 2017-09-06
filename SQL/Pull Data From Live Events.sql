USE quickstart;
SET @maintDate = '2016-11-02';
-- LIVE EVENTS FOR MAINTENANCE PLANNING (CENTER & EU)
-- t1 = Applications
-- t2 = ApplicationTypes
-- t3 = SnapEventAttributes
-- t4 = project
-- t5 = Customers
-- t6 = Partners
-- t1b = Container
-- t6b = Customer's Partner
SELECT t1.Name as 'Event Name', t5.companyName as 'Customer', t6b.companyName as 'Partner',
CASE
WHEN t6b.companyName IS NOT NULL THEN t5.companyName END AS 'Partner\'s Customer', t2.framework_version as 'FW Version',
CASE
WHEN t2.name LIKE '%SingleEvent Event%' THEN 'Single Event'
WHEN t2.name LIKE '%MultiEvent Event%' THEN 'Multi Event' END AS "App Type",
 t1b.Name as 'Container Name', t1b.id as 'Container ID', t1.id as 'Project ID', t3.status as 'Event Status',t1b.status as 'Container Status', t1.eventStartDate as 'Start', t1.eventEndDate as 'End', DATEDIFF(t1.eventEndDate, t1.eventStartDate) AS 'Duration (Days)', t1.size as 'Size', t1.timeZone as 'Time Zone'
FROM Applications as t1
LEFT JOIN ApplicationTypes as t2 on t2.id = t1.applicationTypes_id
LEFT JOIN Customers as t5 on t5.id = t1.Customers_id
LEFT JOIN Partners as t6 on t6.id = t1.Partners_id
LEFT JOIN project as t4 on t4.id = t1.project_id
LEFT JOIN Applications as t1b on t2.Applications_id = t1b.id
LEFT JOIN Partners as t6b on t6b.id = t1b.Partners_id
LEFT JOIN SnapEventAttributes as t3 on t1.id = t3.Applications_id
WHERE t4.active_version_id=t1b.id
AND t4.expiry_date > @maintDate
AND t2.isSnapApp=0
AND t4.app_type=0
AND DATEDIFF(t1.eventEndDate, t1.eventStartDate) < 30
AND t1.eventStartDate <= @maintDate
AND t1.eventEndDate >= @maintDate;