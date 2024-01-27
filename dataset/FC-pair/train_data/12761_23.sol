contract c12761{
    /**
    * @dev Calculates and returns proof-of-stake reward for provided time
    *
    * @param _now timestamp The time for which the reward will be calculated
    */
    function calculateRewardAt(uint256 _now) public view returns (uint256) {
        return calculateRewardInternal(msg.sender, _now);
    }
}