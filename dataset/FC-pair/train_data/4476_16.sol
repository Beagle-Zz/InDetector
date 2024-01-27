contract c4476{
    /**
    * @notice Oraclize callback (triggered by Oraclize)
    * @param _requestId requestId corresponding to Oraclize query
    * @param _result data returned by Oraclize URL query
    */
    function __callback(bytes32 _requestId, string _result) public {
        require(msg.sender == oraclize_cbAddress(), "Only Oraclize can access this method");
        require(!freezeOracle, "Oracle is frozen");
        require(!ignoreRequestIds[_requestId], "Ignoring requestId");
        require(requestIds[_requestId] >= latestUpdate, "Result is stale");
        require(requestIds[_requestId] <= now + oraclizeTimeTolerance, "Result is early");
        uint256 newPOLYUSD = parseInt(_result, 18);
        uint256 bound = POLYUSD.mul(sanityBounds).div(10**18);
        if (latestUpdate != 0) {
          require(newPOLYUSD <= POLYUSD.add(bound), "Result is too large");
          require(newPOLYUSD >= POLYUSD.sub(bound), "Result is too small");
        }
        latestUpdate = requestIds[_requestId];
        delete requestIds[_requestId];
        emit LogPriceUpdated(newPOLYUSD, POLYUSD, latestUpdate);
        POLYUSD = newPOLYUSD;
    }
}