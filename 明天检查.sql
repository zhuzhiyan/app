select ISNULL(d.����,0),ISNULL(a.����������,0),*
from WLA�ͻ�����ϸ as  a
left join 
(
select 
	sum(b.����) as ����
	,b.�ͻ�����ϸID
from WLA������ϸ as b 
inner join WLA���� as c on c.����ID = b.����ID
where c.��ⵥ������ = '108' and isnull(c.�Ƿ�����,0) = 0 and isnull(b.����ʶ,0) = 0
group by b.�ͻ�����ϸID
) as d on a.ID = d.�ͻ�����ϸID 
where 
 ISNULL(d.����,0)<>ISNULL(a.����������,0)

go

select ISNULL(����������,0),ISNULL(����,0) ,* from  WLA�ͻ�����ϸ where  ISNULL(����������,0)>ISNULL(����,0) and ISNULL(����������,0)<>0 and isnull(�����������Ƿ��һ�δ�������,0)=0
select * from  WLA�ͻ�����ϸ  where  ISNULL(����������,0)=0  and isnull(�����������Ƿ��һ�δ�������,0)=1
select * from  WLA�ͻ�����ϸ  where  ISNULL(����������,0)<ISNULL(����,0) and isnull(�����������Ƿ��һ�δ�������,0)=1
go

select 'ok'


select * from WLA�ͻ���