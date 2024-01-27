contract c12761{
    /**
    * @dev Calculates and returns proof-of-stake reward for provided address
    *
    * @param _address address The address for which reward will be calculated
    * @param _now timestamp The time for which the reward will be calculated
    */
    function calculateRewardInternal(address _address, uint256 _now) private view returns (uint256) {
        uint256 _coinAge = getCoinAgeInternal(_address, _now);
        if (_coinAge <= 0) {
            return 0;
        }
        uint256 interest = getAnnualInterest(_now);
        return (_coinAge.mul(interest)).div(365 * 100);
    }
}