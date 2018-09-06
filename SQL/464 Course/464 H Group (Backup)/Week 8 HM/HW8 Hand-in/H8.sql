#1) Creating managerial reports using OLAP tools: Complete the attached as- signment titled ‘MSTR9 AdventTechnologyAssignment.pdf’ on Canvas. It has three questions. Read the assignment for help with navigation on the Micros- trategy web interface. The reports required can be created by specifying the correct parameters on the OLAP tool.Once you create the desired reports, click Tools Report Details Page to view the SQL queries for each of the three questions. Copy these queries to a text editor to complete the next steps.



		#1a. Make a list of any rep that is in the Southern USA office who has landed a deal that was large enough to be in the Top 10 deals in 2009 Q4 for the company. In the report, display Opportunity, Account, Sales Representative, Opportunity Close Date, Primary Competitor and Deal Size.

		select	a11.OPTY_ID  OPTY_ID,
		max(a14.OPTY_DESC)  OPTY_DESC,
		a11.ACCT_ID  ACCT_ID,
		max(a15.ACCT_DESC)  ACCT_DESC,
		a11.SALES_REP_ID  SALES_REP_ID,
		max(a16.SALES_REP_NAME)  SALES_REP_NAME,
		a14.OPTY_CLOSE_DATE  OPTY_CLOSE_DATE,
		a14.PRIMARY_COMP_ID  PRIMARY_COMP_ID,
		max(a17.COMPETITOR_NAME)  COMPETITOR_NAME,
		sum(a11.OPTY_SIZE)  WJXBFS1
	from	F_OPTY_MNTH_HIST	a11
		join	(select	pa11.ACCT_ID  ACCT_ID,
			pa11.OPTY_ID  OPTY_ID,
			pa11.SALES_REP_ID  SALES_REP_ID
		from	(select	a11.ACCT_ID  ACCT_ID,
				a11.OPTY_ID  OPTY_ID,
				a11.SALES_REP_ID  SALES_REP_ID,
				rank () over( order by sum(a11.OPTY_SIZE) desc)  WJXBFS1
			from	F_OPTY_MNTH_HIST	a11
				join	L_CAL_MNTH	a12
				  on 	(a11.MNTH_ID = a12.MNTH_ID)
			where	(a11.OPTY_STAT_ID in (5)
			 and a12.QTR_ID in (20094))
			group by	a11.ACCT_ID,
				a11.OPTY_ID,
				a11.SALES_REP_ID
			)	pa11
		where	(pa11.WJXBFS1 <=  10.0)
		)	pa12
		  on 	(a11.ACCT_ID = pa12.ACCT_ID and 
		a11.OPTY_ID = pa12.OPTY_ID and 
		a11.SALES_REP_ID = pa12.SALES_REP_ID)
		join	L_CAL_MNTH	a13
		  on 	(a11.MNTH_ID = a13.MNTH_ID)
		join	L_OPTY	a14
		  on 	(a11.OPTY_ID = a14.OPTY_ID)
		join	L_ACCT	a15
		  on 	(a11.ACCT_ID = a15.ACCT_ID)
		join	L_SALES_REP	a16
		  on 	(a11.SALES_REP_ID = a16.SALES_REP_ID)
		join	L_COMPETITOR	a17
		  on 	(a14.PRIMARY_COMP_ID = a17.COMPETITOR_ID)
	where	(a13.QTR_ID in (20094)
	 and a11.OPTY_STAT_ID in (5))
	 and SALES_DIST_ID in (3)
	group by	a11.OPTY_ID,
		a11.ACCT_ID,
		a11.SALES_REP_ID,
		a14.OPTY_CLOSE_DATE,
		a14.PRIMARY_COMP_ID

	#[Analytical engine calculation steps:
	#	1.  Perform dynamic aggregation over <Sales Region>
	#	2.  Perform cross-tabbing
	#]

		#1b. Generate a list of the projects in the current pipeline for Southern USA that shows who the rep working on the project is, as well as the customer and expected worth of the project (2010 Q1). In the report, display Current Opportunity Status, Sales Representative, Opportunities and Opportunity Size.


		select	pa11.OPTY_STAT_ID  OPTY_STAT_ID,
			max(a14.OPTY_STAT_DESC)  OPTY_STAT_DESC,
			pa11.SALES_REP_ID  SALES_REP_ID,
			max(a15.SALES_REP_NAME)  SALES_REP_NAME,
			pa11.OPTY_ID  OPTY_ID,
			max(a13.OPTY_DESC)  OPTY_DESC,
			pa11.QTR_ID  QTR_ID,
			max(a16.QTR_DESC)  QTR_DESC,
			max(pa11.WJXBFS1)  WJXBFS1
		from	(select	a11.SALES_REP_ID  SALES_REP_ID,
				a12.QTR_ID  QTR_ID,
				a11.OPTY_STAT_ID  OPTY_STAT_ID,
				a11.OPTY_ID  OPTY_ID,
				a11.MNTH_ID  MNTH_ID,
				sum(a11.OPTY_SIZE)  WJXBFS1
			from	F_OPTY_MNTH_HIST	a11
				join	L_CAL_MNTH	a12
				  on 	(a11.MNTH_ID = a12.MNTH_ID)
				join	L_SALES_REP	a13
				  on 	(a11.SALES_REP_ID = a13.SALES_REP_ID)
			where	(a13.SALES_DIST_ID in (3)
			 and a12.QTR_ID in (20101))
			group by	a11.SALES_REP_ID,
				a12.QTR_ID,
				a11.OPTY_STAT_ID,
				a11.OPTY_ID,
				a11.MNTH_ID
			)	pa11
			join	(select	pc11.SALES_REP_ID  SALES_REP_ID,
				pc11.QTR_ID  QTR_ID,
				pc11.OPTY_STAT_ID  OPTY_STAT_ID,
				pc11.OPTY_ID  OPTY_ID,
				max(pc11.MNTH_ID)  WJXBFS1
			from	(select	a11.SALES_REP_ID  SALES_REP_ID,
				a12.QTR_ID  QTR_ID,
				a11.OPTY_STAT_ID  OPTY_STAT_ID,
				a11.OPTY_ID  OPTY_ID,
				a11.MNTH_ID  MNTH_ID,
				sum(a11.OPTY_SIZE)  WJXBFS1
			from	F_OPTY_MNTH_HIST	a11
				join	L_CAL_MNTH	a12
				  on 	(a11.MNTH_ID = a12.MNTH_ID)
				join	L_SALES_REP	a13
				  on 	(a11.SALES_REP_ID = a13.SALES_REP_ID)
			where	(a13.SALES_DIST_ID in (3)
			 and a12.QTR_ID in (20101))
			group by	a11.SALES_REP_ID,
				a12.QTR_ID,
				a11.OPTY_STAT_ID,
				a11.OPTY_ID,
				a11.MNTH_ID
			)	pc11
			group by	pc11.SALES_REP_ID,
				pc11.QTR_ID,
				pc11.OPTY_STAT_ID,
				pc11.OPTY_ID
			)	pa12
			  on 	(pa11.MNTH_ID = pa12.WJXBFS1 and 
			pa11.OPTY_ID = pa12.OPTY_ID and 
			pa11.OPTY_STAT_ID = pa12.OPTY_STAT_ID and 
			pa11.QTR_ID = pa12.QTR_ID and 
			pa11.SALES_REP_ID = pa12.SALES_REP_ID)
			join	L_OPTY	a13
			  on 	(pa11.OPTY_ID = a13.OPTY_ID)
			join	L_OPTY_STATUS	a14
			  on 	(pa11.OPTY_STAT_ID = a14.OPTY_STAT_ID)
			join	L_SALES_REP	a15
			  on 	(pa11.SALES_REP_ID = a15.SALES_REP_ID)
			join	L_CAL_QTR	a16
			  on 	(pa11.QTR_ID = a16.QTR_ID)
		group by	pa11.OPTY_STAT_ID,
			pa11.SALES_REP_ID,
			pa11.OPTY_ID,
			pa11.QTR_ID

		[Analytical engine calculation steps:
			1.  Evaluate thresholds
			2.  Perform cross-tabbing
		]


		#1c. Generate a report that shows all districts’ Current Pipeline vs. Quota for US Region for easy comparison for (2010 Q1). In the report, display metrics relevant to this report, and columns as Northern, Central and Southern USA, and Tota


		select	coalesce(pa11.SALES_DIST_ID, pa12.SALES_DIST_ID, pa13.SALES_DIST_ID)  SALES_DIST_ID,
			max(a17.SALES_DIST_DESC)  SALES_DIST_DESC,
			a17.SALES_REGN_ID  SALES_REGN_ID,
			max(a17.SALES_REGN_DESC)  SALES_REGN_DESC,
			max(pa11.WJXBFS1)  WJXBFS1,
			max(pa12.WJXBFS1)  WJXBFS2,
			max(pa13.WJXBFS1)  WJXBFS3,
			max(pa13.WJXBFS2)  WJXBFS4,
			(ZEROIFNULL(max(pa11.WJXBFS1)) + ZEROIFNULL(max(pa13.WJXBFS3)))  WJXBFS5,
			((ZEROIFNULL(max(pa11.WJXBFS1)) + ZEROIFNULL(max(pa13.WJXBFS4))) - ZEROIFNULL(max(pa12.WJXBFS1)))  WJXBFS6,
			max(pa13.WJXBFS5)  WJXBFS7,
			max(pa14.WJXBFS1)  WJXBFS8,
			max(pa14.WJXBFS2)  WJXBFS9,
			max(pa14.WJXBFS3)  WJXBFSa
		from	(select	a13.SALES_DIST_ID  SALES_DIST_ID,
				sum(a11.OPTY_SIZE)  WJXBFS1
			from	F_OPTY_MNTH_HIST	a11
				join	L_CAL_MNTH	a12
				  on 	(a11.MNTH_ID = a12.MNTH_ID)
				join	L_SALES_REP	a13
				  on 	(a11.SALES_REP_ID = a13.SALES_REP_ID)
			where	(a12.QTR_ID in (20101)
			 and a13.SALES_DIST_ID in (1, 2, 3)
			 and a11.OPTY_STAT_ID in (5))
			group by	a13.SALES_DIST_ID
			)	pa11
			full outer join	(select	a12.SALES_DIST_ID  SALES_DIST_ID,
				sum(a11.SALES_REP_QTA)  WJXBFS1
			from	F_SALES_REP_QTA	a11
				join	L_SALES_REP	a12
				  on 	(a11.SALES_REP_ID = a12.SALES_REP_ID)
			where	(a11.QTR_ID in (20101)
			 and a12.SALES_DIST_ID in (1, 2, 3))
			group by	a12.SALES_DIST_ID
			)	pa12
			  on 	(pa11.SALES_DIST_ID = pa12.SALES_DIST_ID)
			full outer join	(select	pa11.SALES_DIST_ID  SALES_DIST_ID,
				pa11.WJXBFS1  WJXBFS1,
				pa11.WJXBFS2  WJXBFS2,
				pa11.WJXBFS3  WJXBFS3,
				pa11.WJXBFS4  WJXBFS4,
				pa12.WJXBFS1  WJXBFS5
			from	(select	pa11.SALES_DIST_ID  SALES_DIST_ID,
					sum(pa11.WJXBFS1)  WJXBFS1,
					sum(pa11.WJXBFS2)  WJXBFS2,
					sum(pa11.WJXBFS2)  WJXBFS3,
					sum(pa11.WJXBFS2)  WJXBFS4
				from	(select	a11.SALES_REP_ID  SALES_REP_ID,
						a14.SALES_DIST_ID  SALES_DIST_ID,
						a11.OPTY_STAT_ID  OPTY_STAT_ID,
						a11.OPTY_ID  OPTY_ID,
						a11.MNTH_ID  MNTH_ID,
						a11.LEAD_ID  LEAD_ID,
						a11.ACCT_ID  ACCT_ID,
						a11.OPTY_SIZE  WJXBFS1,
						a11.WGHT_OPTY_SIZE  WJXBFS2,
						a11.OPTY_ID  WJXBFS3
					from	F_OPTY_MNTH_HIST	a11
						join	L_OPTY	a12
						  on 	(a11.OPTY_ID = a12.OPTY_ID)
						join	L_CAL_MNTH	a13
						  on 	(a11.MNTH_ID = a13.MNTH_ID)
						join	L_SALES_REP	a14
						  on 	(a11.SALES_REP_ID = a14.SALES_REP_ID)
					where	(a13.QTR_ID in (20101)
					 and a14.SALES_DIST_ID in (1, 2, 3)
					 and a12.CURR_OPTY_STAT_ID in (2, 1, 3))
					)	pa11
					join	(select	pc11.SALES_DIST_ID  SALES_DIST_ID,
						max(pc11.MNTH_ID)  WJXBFS1
					from	(select	a11.SALES_REP_ID  SALES_REP_ID,
						a14.SALES_DIST_ID  SALES_DIST_ID,
						a11.OPTY_STAT_ID  OPTY_STAT_ID,
						a11.OPTY_ID  OPTY_ID,
						a11.MNTH_ID  MNTH_ID,
						a11.LEAD_ID  LEAD_ID,
						a11.ACCT_ID  ACCT_ID,
						a11.OPTY_SIZE  WJXBFS1,
						a11.WGHT_OPTY_SIZE  WJXBFS2,
						a11.OPTY_ID  WJXBFS3
					from	F_OPTY_MNTH_HIST	a11
						join	L_OPTY	a12
						  on 	(a11.OPTY_ID = a12.OPTY_ID)
						join	L_CAL_MNTH	a13
						  on 	(a11.MNTH_ID = a13.MNTH_ID)
						join	L_SALES_REP	a14
						  on 	(a11.SALES_REP_ID = a14.SALES_REP_ID)
					where	(a13.QTR_ID in (20101)
					 and a14.SALES_DIST_ID in (1, 2, 3)
					 and a12.CURR_OPTY_STAT_ID in (2, 1, 3))
					)	pc11
					group by	pc11.SALES_DIST_ID
					)	pa12
					  on 	(pa11.MNTH_ID = pa12.WJXBFS1 and 
					pa11.SALES_DIST_ID = pa12.SALES_DIST_ID)
				group by	pa11.SALES_DIST_ID
				)	pa11
				left outer join	(select	pa11.SALES_DIST_ID  SALES_DIST_ID,
					count(distinct pa11.WJXBFS3)  WJXBFS1
				from	(select	a11.SALES_REP_ID  SALES_REP_ID,
						a14.SALES_DIST_ID  SALES_DIST_ID,
						a11.OPTY_STAT_ID  OPTY_STAT_ID,
						a11.OPTY_ID  OPTY_ID,
						a11.MNTH_ID  MNTH_ID,
						a11.LEAD_ID  LEAD_ID,
						a11.ACCT_ID  ACCT_ID,
						a11.OPTY_SIZE  WJXBFS1,
						a11.WGHT_OPTY_SIZE  WJXBFS2,
						a11.OPTY_ID  WJXBFS3
					from	F_OPTY_MNTH_HIST	a11
						join	L_OPTY	a12
						  on 	(a11.OPTY_ID = a12.OPTY_ID)
						join	L_CAL_MNTH	a13
						  on 	(a11.MNTH_ID = a13.MNTH_ID)
						join	L_SALES_REP	a14
						  on 	(a11.SALES_REP_ID = a14.SALES_REP_ID)
					where	(a13.QTR_ID in (20101)
					 and a14.SALES_DIST_ID in (1, 2, 3)
					 and a12.CURR_OPTY_STAT_ID in (2, 1, 3))
					)	pa11
				group by	pa11.SALES_DIST_ID
				)	pa12
				  on 	(pa11.SALES_DIST_ID = pa12.SALES_DIST_ID)
			)	pa13
			  on 	(coalesce(pa11.SALES_DIST_ID, pa12.SALES_DIST_ID) = pa13.SALES_DIST_ID)
			left outer join	(select	a14.SALES_DIST_ID  SALES_DIST_ID,
				(Case when max((Case when a12.CURR_OPTY_STAT_ID in (2) then 1 else 0 end)) = 1 then count(distinct (Case when a12.CURR_OPTY_STAT_ID in (2) then a11.OPTY_ID else NULL end)) else NULL end)  WJXBFS1,
				(Case when max((Case when a12.CURR_OPTY_STAT_ID in (1) then 1 else 0 end)) = 1 then count(distinct (Case when a12.CURR_OPTY_STAT_ID in (1) then a11.OPTY_ID else NULL end)) else NULL end)  WJXBFS2,
				(Case when max((Case when a12.CURR_OPTY_STAT_ID in (3) then 1 else 0 end)) = 1 then count(distinct (Case when a12.CURR_OPTY_STAT_ID in (3) then a11.OPTY_ID else NULL end)) else NULL end)  WJXBFS3
			from	F_OPTY_MNTH_HIST	a11
				join	L_OPTY	a12
				  on 	(a11.OPTY_ID = a12.OPTY_ID)
				join	L_CAL_MNTH	a13
				  on 	(a11.MNTH_ID = a13.MNTH_ID)
				join	L_SALES_REP	a14
				  on 	(a11.SALES_REP_ID = a14.SALES_REP_ID)
			where	(a13.QTR_ID in (20101)
			 and a14.SALES_DIST_ID in (1, 2, 3)
			 and (a12.CURR_OPTY_STAT_ID in (2)
			 or a12.CURR_OPTY_STAT_ID in (1)
			 or a12.CURR_OPTY_STAT_ID in (3)))
			group by	a14.SALES_DIST_ID
			)	pa14
			  on 	(coalesce(pa11.SALES_DIST_ID, pa12.SALES_DIST_ID, pa13.SALES_DIST_ID) = pa14.SALES_DIST_ID)
			join	L_SALES_REP	a17
			  on 	(coalesce(pa11.SALES_DIST_ID, pa12.SALES_DIST_ID, pa13.SALES_DIST_ID) = a17.SALES_DIST_ID)
		group by	coalesce(pa11.SALES_DIST_ID, pa12.SALES_DIST_ID, pa13.SALES_DIST_ID),
			a17.SALES_REGN_ID



#2. Next you will create the same reports using SQL by copying/pasting the SQL code from the Microstrategy DW to the SQL interface on TUN.
#(a) Register for Access to the SQL Web Interface for the Microstrategy DW:
#• On the main TUN webpage click Software ‘ Teradata Database
#• Click on Register to Use Teradata SQL Assistant/Web Edition in our Course tunweb.teradata.ws/tunstudent/register.aspx. The Course Password is wmc3317. Create a user ID and password for your- self. You could keep it the same as for the main TUN registration you completed above. Now you are ready to use SQL Assistant on TUN.

Done

#(b) Browse to tunweb.teradata.ws/tunstudent/. Click on Login to SQL Assistant. Click on Select default database as db samwh9 - do not click OK yet.
#1You may need to use a Student Access Password if it asks for one. The password is ‘DataDive’ 1

Done


#(c) Underneath click on Database Descriptions. Find db samwh9 and store the pdf manual on that link. Study the data model under Logical Data Model for 10 minutes with your group members. Observe the schema (tables, attributes and the relationships). You will see the model is huge and depicts a real database model.

Done

#(d) Go back to the browser and click OK to enter the SQL Assistant interface. You can query the data warehouse here called db samwh9. You can run simple queries to examine the data and the structure of the tables.

Done 

#(e) Execute the three SQL queries you created in 1 on this interface to check the results. Confirm that the results are the same as in 1.

All 3 are same, please see attached screen shots

#(f) Click on the ‘+‘ sign on the left panel next to db samwh9 and inspect the table schemas. Take any one of the three queries and explain in plain English how it works to give you the desired result.

So I have taken the first query and am breaking it down to show via comment starting with the "#" on the same line. I have spaced out the query so its a bit earier to visualize, please full screen theis Document


		# Query 1 Explanation --------------------------------------------------------------------	


select	a11.OPTY_ID  OPTY_ID,    														#Select statement from using function to gather calculations, dates, and variables
			max(a14.OPTY_DESC)  OPTY_DESC, 												#Opportuntiy Description
			a11.ACCT_ID  ACCT_ID,							
			max(a15.ACCT_DESC)  ACCT_DESC,
			a11.SALES_REP_ID  SALES_REP_ID,
			max(a16.SALES_REP_NAME)  SALES_REP_NAME,
			a14.OPTY_CLOSE_DATE  OPTY_CLOSE_DATE,
			a14.PRIMARY_COMP_ID  PRIMARY_COMP_ID,
			max(a17.COMPETITOR_NAME)  COMPETITOR_NAME,
			sum(a11.OPTY_SIZE)  WJXBFS1
		from	F_OPTY_MNTH_HIST	a11 												#the inital database table "Lead Generation Table"

																						#This next little bit is where it get confusing

			#Main Joins ---------------------------------------------------------------------------																		

			join (																		# (Join 1)
				  select	pa11.ACCT_ID  ACCT_ID, 										#Pulls accounts IDs, Opportunities, and Sales Rep ID from Table A that match "pa11" (Table B)
				  pa11.OPTY_ID  OPTY_ID, 
				  pa11.SALES_REP_ID  SALES_REP_ID 
				  from (

				  		select	a11.ACCT_ID  ACCT_ID, 									#Pulls the IDs for the accounts, opportunities, and salse rep, organized by order size rank (Table A)
					    a11.OPTY_ID  OPTY_ID,
					    a11.SALES_REP_ID  SALES_REP_ID, 
						rank () over( order by sum(a11.OPTY_SIZE) desc)  WJXBFS1 		#function rank order size of each opportunity and order by it, in the amouont
			from F_OPTY_MNTH_HIST	a11 												# The from Table for Join 1


			join L_CAL_MNTH	a12 # (Join 2)
			on 	(a11.MNTH_ID = a12.MNTH_ID) 											#join based on Month ID
			where	(a11.OPTY_STAT_ID in (5)											#the restrictieon in thes query for the the Southern USA office 
					and a12.QTR_ID in (20094)) 											#the date restriction in thes query for Q4 2009
					group by	a11.ACCT_ID, 											#Group by via Account Id, Opportunity ID, Sales Rep ID
								a11.OPTY_ID,
								a11.SALES_REP_ID
					)pa11


			where	(pa11.WJXBFS1 <=  10.0) 											#the 2nd where restriction for Join 1, asking for the top 10!
			)pa12
			on 	(a11.ACCT_ID = pa12.ACCT_ID and 
				a11.OPTY_ID = pa12.OPTY_ID and 
				a11.SALES_REP_ID = pa12.SALES_REP_ID)

			#Additional Quick Joins -------------------------------------------------------------

			join	L_CAL_MNTH	a13 #Join 3
	  			on 	(a11.MNTH_ID = a13.MNTH_ID) 										#Joining Month IDs with a certain month ID
			join	L_OPTY	a14	#Join 4
	 			 on (a11.OPTY_ID = a14.OPTY_ID) 										#Joining Opportunity IDs with a ceratin opportunity ID
			join	L_ACCT	a15	#Join 5
	  			on 	(a11.ACCT_ID = a15.ACCT_ID) 										#Joining Account Ids with a certain Account ID
			join	L_SALES_REP	a16	#Join 6
	  			on 	(a11.SALES_REP_ID = a16.SALES_REP_ID)								#Joining Rep IDs with a certatin Sale ID
			join	L_COMPETITOR	a17	#Join 7
	 			on 	(a14.PRIMARY_COMP_ID = a17.COMPETITOR_ID) 							#Joining 14 Company Id with the Competitor ID

	 	#Back to Main query ---------------------------------------------------------------------

		where	(a13.QTR_ID in (20094) 													#the date restriction in the main query for Q4 2009 
		and a11.OPTY_STAT_ID in (5)) 													#the restrictieon in thes query for the the Southern USA office 
        and SALES_DIST_ID in (3)                                                        #sales district is Southern USA office
		group by	a11.OPTY_ID, 														#group by statement to organize the data before, the final data is visualied in Order of Account, Rep, Close Date, Company
			a11.ACCT_ID,
			a11.SALES_REP_ID,
			a14.OPTY_CLOSE_DATE,
			a14.PRIMARY_COMP_ID


Conclusion: The query aggregate data from muliple table sources (including created tables in joins, there is like 7+ tables). 
Where organizes the data first in the subquery befores its eleganant bring back the data up the query, sorting them before hand. 
While placing the final restriction on thes main query, but also making sure the same restrcition are placed on the subquery, some
sub query have restriction not in thes main query. This a very complex query with a multitude of joins.







