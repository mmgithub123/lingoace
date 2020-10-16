

差集：
　SELECT Name FROM Person_1
　　EXCEPT
　　SELECT Name FROM Person_2
  返回左边结果集合中已经有的记录，而右边结果集中没有的记录
  
   对于mysql来说 不支持 except  所以用not in 改写替换
   
   
表并列：
把order号与 当前时间，及常数1 并列起来
select t.a,t.time,order_no from tmp_have_order_no_balance,(select 1 as a, now() as time) as t;
+---+---------------------+--------------------------------------+
| a | time                | order_no                             |
+---+---------------------+--------------------------------------+
| 1 | 2020-10-14 07:24:07 | 47 |
| 1 | 2020-10-14 07:24:07 | 0172 |
| 1 | 2020-10-14 07:24:07 | 1311|



create table select * from table  where 1 <> 1; 只建表
copy 表 加数据 create table select * from table 
