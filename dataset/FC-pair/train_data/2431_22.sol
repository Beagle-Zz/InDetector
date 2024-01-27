contract c2431{
    /// @dev Removes an sale from the list of open sales.
    /// @param _assetId - ID of the token on sale
    function _removeSale(uint256 _assetId) internal {
        delete tokenIdToSale[_assetId];
        var cscNFT = CSCNFTFactory(NFTAddress);
        uint256 assetType = cscNFT.getAssetIdItemType(_assetId);
        bool hasFound = false;
        for (uint i = 0; i < assetTypeSalesTokenId[assetType].length; i++) {
            if ( assetTypeSalesTokenId[assetType][i] == _assetId) {
                hasFound = true;
            }
            if(hasFound == true) {
                if(i+1 < assetTypeSalesTokenId[assetType].length)
                    assetTypeSalesTokenId[assetType][i] = assetTypeSalesTokenId[assetType][i+1];
                else 
                    delete assetTypeSalesTokenId[assetType][i];
            }
        }
        assetTypeSalesTokenId[assetType].length--;
    }
}