contract c12761{
    /**
    * @dev Calculates the coin age for given address and time.
    *
    * @param _address address The address for which coinage will be calculated
    * @param _now timestamp The time for which the coinage will be calculated
    */
    function getCoinAgeInternal(address _address, uint256 _now) private view returns (uint256 _coinAge) {
        if (coinAgeRecordMap[_address].length <= 0) {
            return 0;
        }
        for (uint256 i = 0; i < coinAgeRecordMap[_address].length; i++) {
            if (_now < uint256(coinAgeRecordMap[_address][i].time).add(stakeMinAge)) {
                continue;
            }
            uint256 secondsPassed = _now.sub(uint256(coinAgeRecordMap[_address][i].time));
            if (secondsPassed > stakeMaxAge ) {
                secondsPassed = stakeMaxAge;
            }
            _coinAge = _coinAge.add((coinAgeRecordMap[_address][i].amount).mul(secondsPassed.div(1 days)));
        }
    }
}