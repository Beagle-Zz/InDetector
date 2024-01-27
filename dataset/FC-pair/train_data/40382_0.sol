contract c40382{
     
    function addDataRequest(string dataUrl) {
         
        if(msg.sender != organizer) { throw; }
         
        uint nextIndex = dataRequests.length++;
         
        DataRequest newDataRequest = dataRequests[nextIndex];
        newDataRequest.initialized = true;
        newDataRequest.dataUrl = dataUrl;
        NewDataRequest(dataRequests.length - 1, newDataRequest.initialized, newDataRequest.dataUrl);
    }
}