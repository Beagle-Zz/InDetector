contract c4240{
  /**
  * @dev Can be called only once. The method to allow owner to set tier information
  * @param _noOfPhases The integer to set number of tiers
  * @param _startTimes The array containing start time of each tier
  * @param _endTimes The array containing end time of each tier
  * @param _cummulativeHardCaps The array containing cumulative hard cap for each tier
  * @param _bonusPercentages The array containing bonus percentage for each tier
  * The arrays should be in sync with each other. For each index 0 for each of the array should contain info about Tier 1, similarly for Tier2, 3 and 4 .
  * Sales hard cap will be the hard cap of last tier
  */
  function setTiersInfo(uint8 _noOfPhases, uint256[] _startTimes, uint256[] _endTimes, uint256[] _cummulativeHardCaps, uint8[4] _bonusPercentages)private {
    require(_noOfPhases == 4);
    //Each array should contain info about each tier
    require(_startTimes.length == _noOfPhases);
    require(_endTimes.length ==_noOfPhases);
    require(_cummulativeHardCaps.length ==_noOfPhases);
    require(_bonusPercentages.length ==_noOfPhases);
    noOfPhases = _noOfPhases;
    for(uint8 i = 0; i < _noOfPhases; i++){
        require(_cummulativeHardCaps[i] > 0);
        require(_endTimes[i] > _startTimes[i]);
        if(i > 0){
            //start time of this tier should be greater than previous tier
            require(_startTimes[i] > _endTimes[i-1]);
            phases.push(PhaseInfo({
                cummulativeHardCap:_cummulativeHardCaps[i],
                startTime:_startTimes[i],
                endTime:_endTimes[i],
                bonusPercentages:_bonusPercentages[i],
                weiRaised:0
            }));
        }
        else{
            //start time of tier1 should be greater than current time
            require(_startTimes[i] > now);
            phases.push(PhaseInfo({
                cummulativeHardCap:_cummulativeHardCaps[i],
                startTime:_startTimes[i],
                endTime:_endTimes[i],
                bonusPercentages:_bonusPercentages[i],
                weiRaised:0
            }));
        }
    }
  }
}