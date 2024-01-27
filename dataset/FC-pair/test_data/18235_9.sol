contract c18235{
    // To display on website
    function viewUnclaimedResearchDividends() external constant returns (uint256, uint256, uint256) {
        uint256 startSnapshot = lastGooResearchFundClaim[msg.sender];
        uint256 latestSnapshot = allocatedGooResearchSnapshots.length - 1; // No snapshots to begin with
        uint256 researchShare;
        uint256 previousProduction = gooProductionSnapshots[msg.sender][lastGooResearchFundClaim[msg.sender] - 1]; // Underflow won't be a problem as gooProductionSnapshots[][0xfffffffffffff] = 0;
        for (uint256 i = startSnapshot; i <= latestSnapshot; i++) {
            // Slightly complex things by accounting for days/snapshots when user made no tx's
            uint256 productionDuringSnapshot = gooProductionSnapshots[msg.sender][i];
            bool soldAllProduction = gooProductionZeroedSnapshots[msg.sender][i];
            if (productionDuringSnapshot == 0 && !soldAllProduction) {
                productionDuringSnapshot = previousProduction;
            } else {
               previousProduction = productionDuringSnapshot;
            }
            researchShare += (allocatedGooResearchSnapshots[i] * productionDuringSnapshot) / totalGooProductionSnapshots[i];
        }
        return (researchShare, startSnapshot, latestSnapshot);
    }
}