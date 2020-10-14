

差集：
　SELECT Name FROM Person_1
　　EXCEPT
　　SELECT Name FROM Person_2
  返回左边结果集合中已经有的记录，而右边结果集中没有的记录
  
   对于mysql来说 不支持 except  所以用not in 改写替换
