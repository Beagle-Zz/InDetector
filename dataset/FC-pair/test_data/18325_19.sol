contract c18325{
    /// @notice TODO Commenti
    // TOCHECK AGGIUNGERE REQUIRE SU TIPO_OPERAZIONE = 'CASD' ???
    function startWinery(
        string _harvestTrackID,
        string _offChainProducerIdentity,
        string _wineryTrackID,
        uint _productIndex
    )
        external
        wineriesOnly
    {
        require(_productIndex >= 0);
        address producer = getAddress(_offChainProducerIdentity);
        bytes32 harvestMappingID = keccak256(_harvestTrackID, producer);
        bytes32 wineryOperationMappingID = keccak256(_wineryTrackID, msg.sender);
        wineries[wineryOperationMappingID][_productIndex].parentList.push(
            IndexElem(harvestMappingID, -1));
    }
}