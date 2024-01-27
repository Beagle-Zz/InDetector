contract c7214{
    /// @notice Add an asset to the list that this fund owns
    function addAssetToOwnedAssets (address ofAsset)
        public
        pre_cond(isOwner() || msg.sender == address(this))
    {
        isInOpenMakeOrder[ofAsset] = true;
        if (!isInAssetList[ofAsset]) {
            ownedAssets.push(ofAsset);
            isInAssetList[ofAsset] = true;
        }
    }
}