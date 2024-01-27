contract c18325{
    // ======================================================================================
    // ÐApps helpers
    // ======================================================================================
    function getWineryMappingID(string _smartIdentity, string _offChainIdentity)
        external view
        returns (bytes32 wineryMappingID)
    {
        bytes32 index = keccak256(_smartIdentity, getAddress(_offChainIdentity));
        wineryMappingID = bindingSmartIdentity[index];
    }
}