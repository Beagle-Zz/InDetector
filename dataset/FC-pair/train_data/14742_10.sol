contract c14742{
    /// @notice Checks if withdraw cooldown passed 
    modifier isChampWithdrawReady(uint256 _id){
        require(champs[_id].withdrawCooldown < block.timestamp);
        _;
    }
}