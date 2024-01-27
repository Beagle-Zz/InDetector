contract c2728{
    /// @dev Verifies the reward index is valid.
    modifier isValidRewardIndex(uint256 _index) {
        require(_index < rewardPercentage.length, "The reward percentage index does not exist!");
        _;
    }
}