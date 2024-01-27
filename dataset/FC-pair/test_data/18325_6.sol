contract c18325{
    // ============================================================================================
    // Private functions
    // ============================================================================================
    /// @notice TODO Commenti
    function addWineryOperation(
        bytes32 _mappingID,
        address _operationSender,
        string _offChainIdentity,
        string _operationID,
        string _operationCode,
        uint _operationDate,
        uint16 _areaCode,
        string _codeICQRF
    )
        private
    {
        uint size = wineries[_mappingID].length;
        wineries[_mappingID].length++;
        wineries[_mappingID][size].operationSender = _operationSender;
        wineries[_mappingID][size].offChainIdentity = _offChainIdentity;
        wineries[_mappingID][size].operationID = _operationID;
        wineries[_mappingID][size].operationCode = _operationCode;
        wineries[_mappingID][size].operationDate = _operationDate;
        wineries[_mappingID][size].areaCode = _areaCode;
        wineries[_mappingID][size].codeICQRF = _codeICQRF;
    }
}