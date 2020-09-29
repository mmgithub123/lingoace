
canal:

      Message message = connector.getWithoutAck(batchSize);


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
            
            
            
            
            EventType:
                      QUERY
                      DELETE
                      INSERT
      
      RowChage:
      
      
      
      
      
      RowData
      
      
      Column
