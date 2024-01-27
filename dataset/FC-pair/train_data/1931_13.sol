contract c1931{
  /**
   * @dev Function to Increase tokens
   * @param _to The address that will receive the minted tokens.
   * @param _amount The amount of the minted tokens.
   * @return A boolean that indicates if the operation was successful.
   */
    function mint(address _to, uint256 _amount) onlyAdminer public returns (bool) {
        uint256 curTime = block.timestamp;
        uint256 curTimes = curTime.sub(initTime)/(31536000);
        require(curTimes >= lockedYears);
        uint256 _maxAmountPer;
        if(maxAmountPer[curTimes] == 0) {
            maxAmountPer[curTimes] = totalSupply.mul(maxProportion).div(100);
        }
        _maxAmountPer = maxAmountPer[curTimes];
        require(records[curTimes].add(_amount) <= _maxAmountPer);
        records[curTimes] = records[curTimes].add(_amount);
        emit MintRequest(curTimes, _maxAmountPer, records[curTimes]);        
        return(super.mint(_to, _amount));
    }
}