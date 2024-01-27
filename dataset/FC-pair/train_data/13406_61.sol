contract c13406{
    /// @notice Daily mintable MET in current auction
    function dailyMintable() public constant returns (uint) {
        return nextAuctionSupply(0);
    }
}