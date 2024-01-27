contract c2436{
    // Minting Function
    function batchSpawnAsset(address _to, uint256[] _assetTypes, uint256[] _assetIds, uint256 _isAttached) public anyOperator {
        uint256 _id;
        uint256 _assetType;
        for(uint i = 0; i < _assetIds.length; i++) {
            _id = _assetIds[i];
            _assetType = _assetTypes[i];
            _createAsset(_to, _assetType, _id, _isAttached, address(0));
        }
    }
}