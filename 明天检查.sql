select ISNULL(d.数量,0),ISNULL(a.总验收数量,0),*
from WLA送货单明细 as  a
left join 
(
select 
	sum(b.数量) as 数量
	,b.送货单明细ID
from WLA单据明细 as b 
inner join WLA单据 as c on c.单据ID = b.单据ID
where c.入库单据类型 = '108' and isnull(c.是否作废,0) = 0 and isnull(b.红冲标识,0) = 0
group by b.送货单明细ID
) as d on a.ID = d.送货单明细ID 
where 
 ISNULL(d.数量,0)<>ISNULL(a.总验收数量,0)

go

select ISNULL(总验收数量,0),ISNULL(数量,0) ,* from  WLA送货单明细 where  ISNULL(总验收数量,0)>ISNULL(数量,0) and ISNULL(总验收数量,0)<>0 and isnull(总验收数量是否第一次大于数量,0)=0
select * from  WLA送货单明细  where  ISNULL(总验收数量,0)=0  and isnull(总验收数量是否第一次大于数量,0)=1
select * from  WLA送货单明细  where  ISNULL(总验收数量,0)<ISNULL(数量,0) and isnull(总验收数量是否第一次大于数量,0)=1
go

select 'ok'


select * from WLA送货单