contract c4863{
    /// @notice Check is policy exist
    /// @param _policyHash policy hash (sig, contract address)
    /// @return bool
    function isPolicyExist(bytes32 _policyHash) public view returns (bool) {
        return policyId2Index[_policyHash] != 0;
    }
}