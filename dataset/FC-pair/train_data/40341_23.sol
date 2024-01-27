contract c40341{
     
    function validateProposedThroneRules(
        uint _startingClaimPriceWei,
        uint _maximumClaimPriceWei,
        uint _claimPriceAdjustPercent,
        uint _curseIncubationDurationSeconds,
        uint _commissionPerThousand
    ) constant returns (bool allowed) {
         
         
         
        if (_startingClaimPriceWei < 10 finney ||
            _startingClaimPriceWei > 100 ether) {
            return false;
        }
        if (_maximumClaimPriceWei < 1 ether ||
            _maximumClaimPriceWei > 100000 ether) {
            return false;
        }
        if (_startingClaimPriceWei * 20 > _maximumClaimPriceWei) {
            return false;
        }
        if (_claimPriceAdjustPercent < 10 ||
            _claimPriceAdjustPercent > 900) {
            return false;
        }
        if (_curseIncubationDurationSeconds < 2 hours ||
            _curseIncubationDurationSeconds > 10000 days) {
            return false;
        }
        if (_commissionPerThousand < 10 ||
            _commissionPerThousand > 100) {
            return false;
        }
        return true;
    }
}