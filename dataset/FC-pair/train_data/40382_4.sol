contract c40382{
     
    function addDataPoint(uint dataRequestId, bool success, string response) {
        if(msg.sender != organizer) { throw; }
         
        DataRequest dataRequest = dataRequests[dataRequestId];
        if(!dataRequest.initialized) { throw; }
         
        DataPoint newDataPoint = dataRequest.dataPoints[dataRequest.dataPoints.length++];
        newDataPoint.initialized = true;
        newDataPoint.success = success;
        newDataPoint.response = response;
        AddDataPoint(dataRequestId, success, response);
    }
}