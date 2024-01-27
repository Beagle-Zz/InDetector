contract c16360{
    /// @notice List all existing tokens. It can be filtered by attributes or assets with owner
    /// @param _owner filter all assets by owner
    function getTokenList(address _owner, uint8 _withAttributes, uint256 start, uint256 count) external view returns(
        uint256[6][]
    ) {
        uint256 totalAssets = assets.length;
        if (totalAssets == 0) {
            // Return an empty array
            return new uint256[6][](0);
        } else {
            uint256[6][] memory result = new uint256[6][](totalAssets > count ? count : totalAssets);
            uint256 resultIndex = 0;
            bytes2 hasAttributes  = bytes2(_withAttributes);
            Asset memory asset;
            for (uint256 tokenId = start; tokenId < totalAssets && resultIndex < count; tokenId++) {
                asset = assets[tokenId];
                if (
                    (asset.state != uint8(AssetState.Used)) &&
                    (assetIndexToOwner[tokenId] == _owner || _owner == address(0)) &&
                    (asset.attributes & hasAttributes == hasAttributes)
                ) {
                    result[resultIndex][0] = tokenId;
                    result[resultIndex][1] = asset.ID;
                    result[resultIndex][2] = asset.category;
                    result[resultIndex][3] = uint256(asset.attributes);
                    result[resultIndex][4] = asset.cooldown;
                    result[resultIndex][5] = assetIndexToPrice[tokenId];
                    resultIndex++;
                }
            }
            return result;
        }
    }
}