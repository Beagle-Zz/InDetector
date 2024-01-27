contract c13401{
    /// @notice Daily mintable MET in current auction
    function dailyMintable() public constant returns (uint) {
        return nextAuctionSupply(0);
    }
}