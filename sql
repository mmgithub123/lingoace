


sql中条件，if，case when等
select id,it,id+if(it is NULL,0,it) from fr where it IS NULL 


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


CREATE TEMPORARY TABLE 临时表名 AS
(
    SELECT *  FROM table LIMIT 0,10000
);


create table select * from table  where 1 <> 1; 只建表
copy 表 加数据 create table select * from table 


update 返回
Query OK, 9906 rows affected (2.30 sec)
Rows matched: 13687  Changed: 9906    这个的意思是  查了13687  有一些是相等的 所以没更新 就会是9906
When using UPDATE, MySQL will not update columns where the new value is the same as the old value. 
This creates the possibility that mysql_affected_rows() may not actually equal the number of rows matched


改字段：
alter table accounts_transfer_order modify column to_amount decimal(18,6);

删外键
alter table `accounts_transfer_order` drop foreign key fk_accounts_transfer_order_from_product_id;
加外键
Alter table  `acrder`  add  CONSTRAINT `fk_uct_id` 
FOREIGN KEY (`td`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

导入数据指定列：
LOAD DATA INFILE '/var/lib/mysql-files/insert_data_xuwu.txt' INTO TABLE accounts_transfer_order FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY '\n' (froe_id,to_bad,frnt,e_time);

定义变量：
mysql> select  @max_id:=(select max(id) from accounts_subscription);
使用
select @max_id;
select count(*) from acction where id > @max_id;





四种join方式
join  默认就是inner join  内连接
inner join(内连接），在两张表进行连接查询时，只保留两张表中完全匹配的结果集
left join(左连接)、在两张表进行连接查询时，会返回左表所有的行，即使在右表中没有匹配的记录。
right join（右连接）、在两张表进行连接查询时，会返回右表所有的行，即使在左表中没有匹配的记录。
full join（全连接），在两张表进行连接查询时，返回左表和右表中所有没有匹配的行。



特殊case bug
mysql> insert into  table (from_id,to__id,from_a,to_a,from__id,to__id,remove,create_time,update_time) 
select  from__id,to__id,from_a, to_a,t1.transfer__id,t1.recipient__id,t.remove,t1.create_time,t1.update_time from 
finfer t1 inner join ( select reference, parent__id, balance_id as from__id, amount as from_a from finance__change 
where reason in (10, 11) ) t2 on t1.recipient__id = t2.parent__id and t1.id = t2.reference inner join ( select reference, parent__id, 
balance_id as to__id, amount as to_a from finance__change where reason in (10, 11) ) t3 
on t1.transfer__id = t3.parent__id and t1.id = t3.reference,(select 0 as remove) as t ;

ERROR 1292 (22007): Truncated incorrect DOUBLE value: '1e773fa9-11ac-41ab-8dcb-f84ec2df61e3'


