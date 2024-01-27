contract c11330{
    // TILE-RELATED FUNCTIONS
    // This function claims multiple previously unclaimed tiles in a single transaction.
    // The value assigned to each tile is the msg.value divided by the number of tiles claimed.
    // The msg.value is required to be an even multiple of the number of tiles claimed.
    function storeInitialClaim(address _msgSender, uint16[] _claimedTileIds, uint _claimAmount, bool _useBattleValue) public isValidCaller {
        uint tileCount = _claimedTileIds.length;
        require(tileCount > 0);
        require(_claimAmount >= 1 finney * tileCount); // ensure enough funds paid for all tiles
        require(_claimAmount % tileCount == 0); // ensure payment is an even multiple of number of tiles claimed
        uint valuePerBlockInWei = _claimAmount.div(tileCount); // Due to requires above this is guaranteed to be an even number
        require(valuePerBlockInWei >= 5 finney);
        if (_useBattleValue) {
            subUserBattleValue(_msgSender, _claimAmount, false);  
        }
        addGlobalBlockValueBalance(_claimAmount);
        uint16 tileId;
        bool isNewTile;
        for (uint16 i = 0; i < tileCount; i++) {
            tileId = _claimedTileIds[i];
            isNewTile = bwData.isNewTile(tileId); // Is length 0 if first time purchased
            require(isNewTile); // Can only claim previously unclaimed tiles.
            // Send claim event
            emit TileClaimed(tileId, _msgSender, valuePerBlockInWei, block.timestamp);
            // Update contract state with new tile ownership.
            bwData.storeClaim(tileId, _msgSender, valuePerBlockInWei);
        }
    }
}