contract c18325{
    // ============================================================================================
    // External functions for regulators
    // ============================================================================================
    function storeHarvestOperationByRegulator(
        string _trackIDs,
        string _offChainIdentity,
        string _operationID,
        uint32 _quantity,
        uint16 _areaCode,
        uint16 _year,
        string _attributes
    )
        external
        regulatorsOnly
        returns (bool success)
    {
        address _producer = getAddress(_offChainIdentity);
        storeHarvestOperation(
            keccak256(_trackIDs,_producer),
            msg.sender,
            _offChainIdentity,
            _operationID,
            _quantity,
            _areaCode,
            _year,
            _attributes
        );
        emit LogStoreHarvestOperation(
            _trackIDs,
            msg.sender,
            _producer,
            _operationID
        );
        return true;
    }
}