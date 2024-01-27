contract c2251{
    /**
    *@dev Used by Oraclize to return value of PushData API call
    *@param _oraclizeID unique oraclize identifier of call
    *@param _result Result of API call in string format
    */
    function __callback(bytes32 _oraclizeID, string _result) public {
        QueryInfo storage currentQuery = info[_oraclizeID];
        require(msg.sender == oraclize_cbAddress() && _oraclizeID == queryID);
        currentQuery.value = parseInt(_result,3);
        currentQuery.called = false; 
        if(currentQuery.value == 0){
            currentQuery.value = 1;
        }
        emit DocumentStored(currentQuery.date, currentQuery.value);
    }
}