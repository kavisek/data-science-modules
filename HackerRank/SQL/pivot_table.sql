-- Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

-- Note: Print NULL when there are no more names corresponding to an occupation.


set @Di1 = 0;
set @Pi1 = 0;
set @Si1 = 0;
set @Ai1 = 0;

set @Di2 = 0;
set @Pi2 = 0;
set @Si2 = 0;
set @Ai2 = 0;

set @Di3 = 0;
set @Pi3 = 0;
set @Si3 = 0;
set @Ai3 = 0;

set @Di4 = 0;
set @Pi4 = 0;
set @Si4 = 0;
set @Ai4 = 0;

select Aname,Bname,Cname,Dname from
(select K,A1.Name Aname,B1.Name Bname,C1.Name Cname,D1.Name Dname from
(select Name,@Di1:=@Di1+1 as K from Occupations where Occupation = "Doctor" order by Name) A1
left join
(select Name,@Pi1:=@Pi1+1 as K from Occupations where Occupation = "Professor" order by Name) B1 using(K)
left join
(select Name,@Si1:=@Si1+1 as K from Occupations where Occupation = "Singer" order by Name) C1 using(K)
left join
(select Name,@Ai1:=@Ai1+1 as K from Occupations where Occupation = "Actor" order by Name) D1 using(K)) Af

union
select Aname,Bname,Cname,Dname from
(select K,A2.Name Aname,B2.Name Bname,C2.Name Cname,D2.Name Dname from
(select Name,@Pi2:=@Pi2+1 as K from Occupations where Occupation = "Professor" order by Name) B2
left join
(select Name,@Di2:=@Di2+1 as K from Occupations where Occupation = "Doctor" order by Name) A2 using(K)
left join
(select Name,@Si2:=@Si2+1 as K from Occupations where Occupation = "Singer" order by Name) C2 using(K)
left join
(select Name,@Ai2:=@Ai2+1 as K from Occupations where Occupation = "Actor" order by Name) D2 using(K)) Bf

union
select Aname,Bname,Cname,Dname from
(select K,A3.Name Aname,B3.Name Bname,C3.Name Cname,D3.Name Dname from
(select Name,@Si3:=@Si3+1 as K from Occupations where Occupation = "Singer" order by Name) C3
left join
(select Name,@Di3:=@Di3+1 as K from Occupations where Occupation = "Doctor" order by Name) A3 using(K)
left join
(select Name,@Pi3:=@Pi3+1 as K from Occupations where Occupation = "Professor" order by Name) B3 using(K)
left join
(select Name,@Ai3:=@Ai3+1 as K from Occupations where Occupation = "Actor" order by Name) D3 using(K)) Cf


union
select Aname,Bname,Cname,Dname from
(select K,A4.Name Aname,B4.Name Bname,C4.Name Cname,D4.Name Dname from
(select Name,@Ai4:=@Ai4+1 as K from Occupations where Occupation = "Actor" order by Name) D4
left join
(select Name,@Di4:=@Di4+1 as K from Occupations where Occupation = "Doctor" order by Name) A4 using(K)
left join
(select Name,@Pi4:=@Pi4+1 as K from Occupations where Occupation = "Professor" order by Name) B4 using(K)
left join
(select Name,@Si4:=@Si4+1 as K from Occupations where Occupation = "Singer" order by Name) C4 using(K)) Df
