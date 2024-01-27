contract c11328{
    // Transfer block value to battle points for free 
    function transferBlockValueToBattleValue(uint16 _tileId, uint _amount) public isNotContractCaller {
        require(_amount > 0);
        address claimer;
        uint blockValue;
        (claimer, blockValue) = bwData.getTileClaimerAndBlockValue(_tileId);
        require(claimer == msg.sender);
        uint newBlockValue = blockValue.sub(_amount);
        // Must transfer the entire block value or leave at least 5
        require(newBlockValue == 0 || newBlockValue >= 5 finney);
        if(newBlockValue == 0) {
            bwData.deleteTile(_tileId);
        } else {
            bwData.updateTileBlockValue(_tileId, newBlockValue);
            bwData.deleteOffer(_tileId); // Offer invalid since block value has changed
        }
        uint fee = _amount.mul(BV_TO_BP_FEE).div(100);
        uint userAmount = _amount.sub(fee);
        uint feeBalance = bwData.getFeeBalance();
        feeBalance = feeBalance.add(fee);
        bwData.setFeeBalance(feeBalance);
        bwService.addUserBattleValue(msg.sender, userAmount);
        bwService.subGlobalBlockValueBalance(_amount);
        emit TileRetreated(_tileId, msg.sender, _amount, newBlockValue, block.timestamp);
    }
}