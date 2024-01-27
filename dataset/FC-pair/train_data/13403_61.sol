contract c13403{
    /// @notice Daily mintable MET in current auction
    function dailyMintable() public constant returns (uint) {
        return nextAuctionSupply(0);
    }
}