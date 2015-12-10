global with sharing class IdForensicsController {
    public List<LoginEvent> le{get;set;}
    
    // used to query today's events API Events
    public IdForensicsController() {
        le = [SELECT AdditionalInfo,ApiType,ApiVersion,Application,AuthServiceId,Browser,ClientVersion,CreatedDate,EventDate,Id,LoginGeoId,LoginHistoryId,LoginType,LoginUrl,Platform,SourceIp,Status,UserId,Username 
              FROM LoginEvent 
              LIMIT 10];
   }
    
   // used for the NumLogins MetricType  
   @RemoteAction   
    global static PlatformEventMetrics[] loadNumLogins() {
        return [SELECT MetricDate, MetricValue FROM PlatformEventMetrics
            WHERE MetricType='NumLogins'
            AND MetricDate = Last_n_Days:7
            ];
    }  
    
       
   // used for the NumLoginsByUser MetricType 
    global with sharing class ByNumLoginsByUserResults {
        public PlatformEventMetrics[] metrics;
        public Map<String, String> userNameById;
    }
   
   @RemoteAction   
    global static ByNumLoginsByUserResults loadNumLoginsByUser() {
        ByNumLoginsByUserResults result = new ByNumLoginsByUserResults();
        result.metrics = [SELECT MetricDate, MetricValue,AggregationFieldValue FROM PlatformEventMetrics
            WHERE MetricType='NumLoginsByUser'
            AND MetricDate = Last_n_Days:7
            ];
        
        Map<String,String> userIds = new Map<String,String>();    
        for (PlatformEventMetrics m : result.metrics) {
            userIds.put(m.AggregationFieldValue, null);
        }
        
        for (User user : [SELECT Id, Name FROM User WHERE Id IN :userIds.keySet()]) {
            userIds.put(user.Id, user.Name);
        }
        result.userNameById = userIds;
        
        return result;
    }
    
   
   // used for the NumDistinctIpsByUser MetricType 
   global with sharing class ByNumDistinctIpsByUserResults {
        public PlatformEventMetrics[] metrics;
        public Map<String, String> userNameById;
    }
    
    @RemoteAction   
    global static ByNumDistinctIpsByUserResults loadNumDistinctIpsByUser() {
        ByNumDistinctIpsByUserResults result = new ByNumDistinctIpsByUserResults();
        result.metrics = [SELECT MetricDate, MetricValue,AggregationFieldValue FROM PlatformEventMetrics
            WHERE MetricType='NumDistinctIpsByUser'
            AND MetricDate = Last_n_Days:7
            ];
        
        Map<String,String> userIds = new Map<String,String>();    
        for (PlatformEventMetrics m : result.metrics) {
            userIds.put(m.AggregationFieldValue, null);
        }
        
        for (User user : [SELECT Id, Name FROM User WHERE Id IN :userIds.keySet()]) {
            userIds.put(user.Id, user.Name);
        }
        result.userNameById = userIds;
        
        return result;
    }
    
    // used for the NumDistinctBrowsersByUser MetricType 
   global with sharing class ByNumDistinctBrowsersByUserResults {
        public PlatformEventMetrics[] metrics;
        public Map<String, String> userNameById;
    }

    @RemoteAction   
    global static ByNumDistinctBrowsersByUserResults loadNumDistinctBrowsersByUser() {
        ByNumDistinctBrowsersByUserResults result = new ByNumDistinctBrowsersByUserResults();
        result.metrics = [SELECT MetricDate, MetricValue,AggregationFieldValue FROM PlatformEventMetrics
            WHERE MetricType='NumDistinctBrowsersByUser'
            AND MetricDate = Last_n_Days:7
            ];
        
        Map<String,String> userIds = new Map<String,String>();    
        for (PlatformEventMetrics m : result.metrics) {
            userIds.put(m.AggregationFieldValue, null);
        }
        
        for (User user : [SELECT Id, Name FROM User WHERE Id IN :userIds.keySet()]) {
            userIds.put(user.Id, user.Name);
        }
        result.userNameById = userIds;
        
        return result;
    }
    
   // used for the NumDistinctApplicationsByUser MetricType 
   global with sharing class ByNumDistinctApplicationsByUserResults {
        public PlatformEventMetrics[] metrics;
        public Map<String, String> userNameById;
    }

    @RemoteAction   
    global static ByNumDistinctApplicationsByUserResults loadNumDistinctApplicationsByUser() {
        ByNumDistinctApplicationsByUserResults result = new ByNumDistinctApplicationsByUserResults();
        result.metrics = [SELECT MetricDate, MetricValue,AggregationFieldValue FROM PlatformEventMetrics
            WHERE MetricType='NumDistinctApplicationsByUser'
            AND MetricDate = Last_n_Days:7
            ];
        
        Map<String,String> userIds = new Map<String,String>();    
        for (PlatformEventMetrics m : result.metrics) {
            userIds.put(m.AggregationFieldValue, null);
        }
        
        for (User user : [SELECT Id, Name FROM User WHERE Id IN :userIds.keySet()]) {
            userIds.put(user.Id, user.Name);
        }
        result.userNameById = userIds;
        
        return result;
    }
    
}