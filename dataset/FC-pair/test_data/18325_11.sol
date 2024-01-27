contract c18325{
    // ============================================================================================
    // Helpers for ÐApps
    // ============================================================================================
    function getHarvestOperation(string _trackID, address _producer)
        external view
        returns (
            address operationSender,
            string offChainIdentity,
            string operationID,
            uint32 quantity,
            uint24 areaCode,
            uint16 year,
            string attributes
        )
    {
        bytes32 _mappingID32 = keccak256(_trackID, _producer);
        operationSender = harvests[_mappingID32].operationSender;
        offChainIdentity = harvests[_mappingID32].offChainIdentity;
        operationID = harvests[_mappingID32].operationID;
        quantity = harvests[_mappingID32].quantity;
        areaCode = harvests[_mappingID32].areaCode;
        year = harvests[_mappingID32].year;
        attributes = harvests[_mappingID32].attributes;
    }
}