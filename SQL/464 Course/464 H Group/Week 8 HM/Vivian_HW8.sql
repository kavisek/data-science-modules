#1
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

#2
select	a11.SALES_REP_ID  SALES_REP_ID,
	max(a13.SALES_REP_NAME)  SALES_REP_NAME,
	a11.ACCT_ID  ACCT_ID,
	max(a14.ACCT_DESC)  ACCT_DESC,
	a11.OPTY_ID  OPTY_ID,
	max(a15.OPTY_DESC)  OPTY_DESC,
	a11.OPTY_STAT_ID  OPTY_STAT_ID,
	max(a16.OPTY_STAT_DESC)  OPTY_STAT_DESC,
	a11.STAT_OPEN_DATE  DATE_ID,
	a12.QTR_ID  QTR_ID,
	max(a17.QTR_DESC)  QTR_DESC,
	sum(a11.OPTY_SIZE)  WJXBFS1,
	sum(a11.WGHT_OPTY_SIZE)  WJXBFS2
from	F_OPTY	a11
	join	L_CAL_DATE	a12
	  on 	(a11.STAT_OPEN_DATE = a12.DATE_ID)
	join	L_SALES_REP	a13
	  on 	(a11.SALES_REP_ID = a13.SALES_REP_ID)
	join	L_ACCT	a14
	  on 	(a11.ACCT_ID = a14.ACCT_ID)
	join	L_OPTY	a15
	  on 	(a11.OPTY_ID = a15.OPTY_ID)
	join	L_OPTY_STATUS	a16
	  on 	(a11.OPTY_STAT_ID = a16.OPTY_STAT_ID)
	join	L_CAL_QTR	a17
	  on 	(a12.QTR_ID = a17.QTR_ID)
where	(a13.SALES_DIST_ID in (3)
 and a12.QTR_ID in (20101))
group by	a11.SALES_REP_ID,
	a11.ACCT_ID,
	a11.OPTY_ID,
	a11.OPTY_STAT_ID,
	a11.STAT_OPEN_DATE,
	a12.QTR_ID

#[Analytical engine calculation steps:
#	1.  Perform dynamic aggregation over <Account, Date>
#	2.  Evaluate thresholds
#	3.  Perform cross-tabbing
#]

#3
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
	where	(a11.OPTY_STAT_ID in (5)
	 and a12.QTR_ID in (20101))
	group by	a13.SALES_DIST_ID
	)	pa11
	full outer join	(select	a12.SALES_DIST_ID  SALES_DIST_ID,
		sum(a11.SALES_REP_QTA)  WJXBFS1
	from	F_SALES_REP_QTA	a11
		join	L_SALES_REP	a12
		  on 	(a11.SALES_REP_ID = a12.SALES_REP_ID)
	where	a11.QTR_ID in (20101)
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
			where	(a12.CURR_OPTY_STAT_ID in (2, 1, 3)
			 and a13.QTR_ID in (20101))
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
			where	(a12.CURR_OPTY_STAT_ID in (2, 1, 3)
			 and a13.QTR_ID in (20101))
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
			where	(a12.CURR_OPTY_STAT_ID in (2, 1, 3)
			 and a13.QTR_ID in (20101))
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

#[Analytical engine calculation steps:
#	1.  Calculate metric: <% Quota Achieved (Current)> at original data level
#	2.  Calculate metric: <% Quota Achieved vs. Revenue Projection> at original data level
#	3.  Calculate subtotal: <Total> 
#	4.  Calculate metric: <% Quota Achieved (Current)> at subtotal levels
#	5.  Calculate metric: <% Quota Achieved vs. Revenue Projection> at subtotal levels
#	6.  Evaluate thresholds
#	7.  Perform cross-tabbing
#]
