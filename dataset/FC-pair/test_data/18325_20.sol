contract c18325{
    /// @notice TODO Commenti
    // TOCHECK AGGIUNGERE REQUIRE SU TIPO_OPERAZIONE = 'CASD' ???
    function startProduct(
        string _harvestTrackID,
        string _wineryTrackID,
        string _offChainWineryIdentity,
        int _productIndex
    )
        external
        producersOnly
    {
        require(_productIndex > 0);
        bytes32 harvestMappingID = keccak256(_harvestTrackID, msg.sender);
        address winery = getAddress(_offChainWineryIdentity);
        bytes32 wineryOperationMappingID = keccak256(_wineryTrackID, winery);
        harvests[harvestMappingID].child = IndexElem(wineryOperationMappingID, _productIndex);
    }
}