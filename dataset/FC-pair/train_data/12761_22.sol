contract c12761{
    /**
    * @dev Calculates and returns proof-of-stake reward
    */
    function calculateReward() public view returns (uint256) {
        return calculateRewardInternal(msg.sender, now);                                                    // solium-disable-line
    }
}