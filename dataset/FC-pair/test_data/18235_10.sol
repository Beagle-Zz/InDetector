contract c18235{
    // To display on website
    function viewUnclaimedDepositDividends() external constant returns (uint256, uint256, uint256) {
        uint256 startSnapshot = lastGooDepositFundClaim[msg.sender];
        uint256 latestSnapshot = allocatedGooDepositSnapshots.length - 1; // No snapshots to begin with
        uint256 depositShare;
        for (uint256 i = startSnapshot; i <= latestSnapshot; i++) {
            depositShare += (allocatedGooDepositSnapshots[i] * gooDepositSnapshots[msg.sender][i]) / totalGooDepositSnapshots[i];
        }
        return (depositShare, startSnapshot, latestSnapshot);
    }
}