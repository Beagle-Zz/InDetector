contract c3541{
    // PUBLIC : REDEEMING
    /// @notice Redeems by allocating an ownership percentage only of requestedAssets to the participant
    /// @dev This works, but with loops, so only up to a certain number of assets (right now the max is 4)
    /// @dev Independent of running price feed! Note: if requestedAssets != ownedAssets then participant misses out on some owned value
    /// @param shareQuantity Number of shares owned by the participant, which the participant would like to redeem for a slice of assets
    /// @param requestedAssets List of addresses that consitute a subset of ownedAssets.
    /// @return Whether all assets sent to shareholder or not
    function emergencyRedeem(uint shareQuantity, address[] requestedAssets)
        public
        pre_cond(balances[msg.sender] >= shareQuantity)  // sender owns enough shares
        returns (bool)
    {
        address ofAsset;
        uint[] memory ownershipQuantities = new uint[](requestedAssets.length);
        address[] memory redeemedAssets = new address[](requestedAssets.length);
        // Check whether enough assets held by fund
        for (uint i = 0; i < requestedAssets.length; ++i) {
            ofAsset = requestedAssets[i];
            require(isInAssetList[ofAsset]);
            for (uint j = 0; j < redeemedAssets.length; j++) {
                if (ofAsset == redeemedAssets[j]) {
                    revert();
                }
            }
            redeemedAssets[i] = ofAsset;
            uint assetHoldings = add(
                uint(AssetInterface(ofAsset).balanceOf(address(this))),
                quantityHeldInCustodyOfExchange(ofAsset)
            );
            if (assetHoldings == 0) continue;
            // participant's ownership percentage of asset holdings
            ownershipQuantities[i] = mul(assetHoldings, shareQuantity) / _totalSupply;
            // CRITICAL ERR: Not enough fund asset balance for owed ownershipQuantitiy, eg in case of unreturned asset quantity at address(exchanges[i].exchange) address
            if (uint(AssetInterface(ofAsset).balanceOf(address(this))) < ownershipQuantities[i]) {
                isShutDown = true;
                emit ErrorMessage("CRITICAL ERR: Not enough assetHoldings for owed ownershipQuantitiy");
                return false;
            }
        }
        // Annihilate shares before external calls to prevent reentrancy
        annihilateShares(msg.sender, shareQuantity);
        // Transfer ownershipQuantity of Assets
        for (uint k = 0; k < requestedAssets.length; ++k) {
            // Failed to send owed ownershipQuantity from fund to participant
            ofAsset = requestedAssets[k];
            if (ownershipQuantities[k] == 0) {
                continue;
            } else if (!AssetInterface(ofAsset).transfer(msg.sender, ownershipQuantities[k])) {
                revert();
            }
        }
        emit Redeemed(msg.sender, now, shareQuantity);
        return true;
    }
}