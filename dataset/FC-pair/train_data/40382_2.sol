contract c40382{
     
    function getDataRequest(uint id) {
        DataRequest dataRequest = dataRequests[id];
        GetDataRequest(id, dataRequest.initialized, dataRequest.dataUrl, dataRequest.dataPoints.length);
    }
}