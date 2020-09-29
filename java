
canal:

       CanalConnector connector = CanalConnectors.newSingleConnector(new InetSocketAddress(ip, 11111),
                destination,
                "canal",
                "canal");//创建连接

      connector.connect();//连接
      connector.subscribe();//指定要订阅什么内容，就是那个库哪个表
      Message message = connector.getWithoutAck(batchSize);// 获取指定数量的数据
      {业务逻辑代码}
      connector.ack(batchId); // 提交确认
      connector.rollback(); // 处理失败, 回滚数据
      connector.disconnect()//断开连接


      Message:

      
      Entry = message.getEntries()
      Entry:
            EntryType:TRANSACTIONBEGIN,TRANSACTIONEND,ROWDATA
            Header:
                   logfile
                   offset
                   dbname
                   tablename
                   excute time
            
            
            
            EventType eventType = rowChage.getEventType();
            EventType:
                      QUERY
                      DELETE
                      INSERT
      
      
      rowChage = RowChange.parseFrom(entry.getStoreValue());
      RowChange:
      
      
      rowData : rowChage.getRowDatasList()
      RowData
      
      
      column = rowData.getAfterColumnsList()
      Column





      
      
      Entry
    Header
        version         [协议的版本号,default = 1]
        logfileName     [binlog文件名]
        logfileOffset   [binlog position]
        serverId        [服务端serverId]
        serverenCode    [变更数据的编码]
        executeTime     [变更数据的执行时间]
        sourceType      [变更数据的来源,default = MYSQL]
        schemaName      [变更数据的schemaname]
        tableName       [变更数据的tablename]
        eventLength     [每个event的长度]
        eventType       [insert/update/delete类型,default = UPDATE]
        props           [预留扩展]
        gtid            [当前事务的gitd]
    entryType           [事务头BEGIN/事务尾END/数据ROWDATA/HEARTBEAT/GTIDLOG]
    storeValue          [byte数据,可展开，对应的类型为RowChange]    
RowChange
    tableId             [tableId,由数据库产生]
    eventType           [数据变更类型,default = UPDATE]
    isDdl               [标识是否是ddl语句，比如create table/drop table]
    sql                 [ddl/query的sql语句]
    rowDatas            [具体insert/update/delete的变更数据，可为多条，1个binlog event事件可对应多条变更，比如批处理]
        beforeColumns   [字段信息，增量数据(修改前,删除前),Column类型的数组]
        afterColumns    [字段信息，增量数据(修改后,新增后),Column类型的数组] 
        props           [预留扩展]
    props               [预留扩展]
    ddlSchemaName       [ddl/query的schemaName，会存在跨库ddl，需要保留执行ddl的当前schemaName]
Column 
    index               [字段下标]      
    sqlType             [jdbc type]
    name                [字段名称(忽略大小写)，在mysql中是没有的]
    isKey               [是否为主键]
    updated             [是否发生过变更]
    isNull              [值是否为null]
    props               [预留扩展]
    value               [字段值,timestamp,Datetime是一个时间格式的文本]
    length              [对应数据对象原始长度]
    mysqlType           [字段mysql类型]
      
      
      
      
      
