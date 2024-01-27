contract c12761{
    /**
    * @dev Calculates and returns proof-of-stake reward for provided address and time
    *
    * @param _address address The address for which reward will be calculated
    * @param _now timestamp The time for which the reward will be calculated
    */
    function calculateRewardForAddressAt(address _address, uint256 _now) public view onlyOwner returns (uint256) {
        return calculateRewardInternal(_address, _now);
    }
}