contract c136{
    /// @dev acquire funds from owned contracts
    function syncFunds() external {
        uint256 prevBalance = address(this).balance;
        HorseyToken(tokenAddress).withdraw();
        HorseyExchange(exchangeAddress).withdraw();
        uint256 newBalance = address(this).balance;
        //add to
        toBeDistributed = toBeDistributed + (newBalance - prevBalance);
    }
}