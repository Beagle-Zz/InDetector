contract c13401{
    /// @notice return the expected ETH for MET
    /// @param _depositAmount MET.
    /// @return expected ETH value for MET
    function getEthForMetResult(uint _depositAmount) public view returns (uint256) {
        return convertingReturn(WhichToken.Met, _depositAmount);
    }
}