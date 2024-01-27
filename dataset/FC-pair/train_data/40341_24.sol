contract c40341{
     
     
     
     
     
     
     
     
     
    function createKingdom(
        string _kingdomName,
        address _world,
        address _topWizard,
        address _subWizard,
        uint _startingClaimPriceWei,
        uint _maximumClaimPriceWei,
        uint _claimPriceAdjustPercent,
        uint _curseIncubationDurationSeconds,
        uint _commissionPerThousand
    ) returns (Kingdom newKingdom) {
        if (msg.value > 0) {
             
            throw;
        }
         
        if (_topWizard == 0 || _subWizard == 0) {
            throw;
        }
        if (_topWizard == _world || _subWizard == _world) {
            throw;
        }
        if (!validateProposedThroneRules(
            _startingClaimPriceWei,
            _maximumClaimPriceWei,
            _claimPriceAdjustPercent,
            _curseIncubationDurationSeconds,
            _commissionPerThousand
        )) {
            throw;
        }
        return new Kingdom(
            _kingdomName,
            _world,
            _topWizard,
            _subWizard,
            _startingClaimPriceWei,
            _maximumClaimPriceWei,
            _claimPriceAdjustPercent,
            _curseIncubationDurationSeconds,
            _commissionPerThousand
        );
    }
}