contract c4476{
    /**
    * @notice Allows owner to schedule future Oraclize calls
    * @param _times UNIX timestamps to schedule Oraclize calls as of. Empty list means trigger an immediate query.
    */
    function schedulePriceUpdatesFixed(uint256[] _times) payable isAdminOrOwner public {
        bytes32 requestId;
        if (_times.length == 0) {
            require(oraclize_getPrice("URL") <= address(this).balance, "Insufficient Funds");
            requestId = oraclize_query("URL", oracleURL, gasLimit);
            requestIds[requestId] = now;
            if (latestScheduledUpdate < requestIds[requestId]) {
                latestScheduledUpdate = requestIds[requestId];
            }
            emit LogNewOraclizeQuery(now, requestId, oracleURL);
        } else {
            require(oraclize_getPrice("URL") * _times.length <= address(this).balance, "Insufficient Funds");
            for (uint256 i = 0; i < _times.length; i++) {
                requestId = oraclize_query(_times[i], "URL", oracleURL, gasLimit);
                requestIds[requestId] = _times[i];
                emit LogNewOraclizeQuery(_times[i], requestId, oracleURL);
            }
            if (latestScheduledUpdate < requestIds[requestId]) {
                latestScheduledUpdate = requestIds[requestId];
            }
        }
    }
}