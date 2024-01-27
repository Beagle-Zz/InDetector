contract c18325{
    // ============================================================================================
    // External functions for regulators
    // ============================================================================================
    function addWineryOperationByRegulator(
        string _trackID,
        string _offChainIdentity,
        string _operationID,
        string _operationCode,
        uint _operationDate,
        uint16 _areaCode,
        string _codeICQRF
    )
        external
        regulatorsOnly
    {
        address _winery = getAddress(_offChainIdentity);
        bytes32 _mappingID = keccak256(_trackID, _winery);
        addWineryOperation(
            _mappingID,
            msg.sender,
            _offChainIdentity,
            _operationID,
            _operationCode,
            _operationDate,
            _areaCode,
            _codeICQRF
        );
        emit LogAddWineryOperation(
            _trackID,
            msg.sender,
            _winery,
            _operationID,
            wineries[_mappingID].length
        );
    }
}