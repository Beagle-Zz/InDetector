contract c13631{
    /**
    * @dev Calculates and returns proof-of-stake reward for provided address and time
    *
    * @param _address address The address for which reward will be calculated
    */
    function calculateRewardForAddress(address _address) public view onlyOwner returns (uint256) {
        return calculateRewardInternal(_address, now);
    }
}