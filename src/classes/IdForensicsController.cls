global with sharing class IdForensicsController {
  
   // used for the NumLogins MetricType  
   @RemoteAction   
    global static PlatformEventMetrics[] loadNumLogins() {
        return [SELECT MetricTime, MetricValue FROM PlatformEventMetrics
            WHERE MetricType='NumLogins'
            AND MetricTime = Last_n_Days:7
            ORDER BY MetricTime DESC NULLS FIRST ];
    }  
    
       
   // used for the NumLoginsByUser MetricType 
    global with sharing class ByNumLoginsByUserResults {
        public PlatformEventMetrics[] metrics;
        public Map<String, String> userNameById;
    }
   
   @RemoteAction   
    global static ByNumLoginsByUserResults loadNumLoginsByUser() {
        ByNumLoginsByUserResults result = new ByNumLoginsByUserResults();
        result.metrics = [SELECT MetricTime, MetricValue,AggregationFieldValue FROM PlatformEventMetrics
            WHERE MetricType='NumLoginsByUser'
            AND MetricTime = Last_n_Days:7
            ORDER BY MetricTime,AggregationFieldValue DESC NULLS FIRST];
        
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
        result.metrics = [SELECT MetricTime, MetricValue,AggregationFieldValue FROM PlatformEventMetrics
            WHERE MetricType='NumDistinctIpsByUser'
            AND MetricTime = Last_n_Days:7
            ORDER BY MetricTime,AggregationFieldValue DESC NULLS FIRST];
        
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
        result.metrics = [SELECT MetricTime, MetricValue,AggregationFieldValue FROM PlatformEventMetrics
            WHERE MetricType='NumDistinctBrowsersByUser'
            AND MetricTime = Last_n_Days:7
            ORDER BY MetricTime,AggregationFieldValue DESC NULLS FIRST];
        
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
        result.metrics = [SELECT MetricTime, MetricValue,AggregationFieldValue FROM PlatformEventMetrics
            WHERE MetricType='NumDistinctApplicationsByUser'
            AND MetricTime = Last_n_Days:7
            ORDER BY MetricTime,AggregationFieldValue DESC NULLS FIRST];
        
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