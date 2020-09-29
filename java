
canal:

      connector.connect();//连接
      connector.subscribe();//指定要订阅什么内容，就是那个库哪个表
      Message message = connector.getWithoutAck(batchSize);// 获取指定数量的数据
      {业务逻辑代码}
      connector.ack(batchId); // 提交确认
      connector.rollback(); // 处理失败, 回滚数据


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
      
      RowChange:
      
      
      
      
      rowData : rowChage.getRowDatasList()
      RowData
      
      
      Column
