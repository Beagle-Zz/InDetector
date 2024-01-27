contract c2716{
    /// @dev Allows user to check their staked balance
    /// @return staked balance
    function getStakedBalance() view external returns (uint stakedBalance) {
        return stakeBalances[msg.sender].stakeBalance;
    }
}