contract c13403{
    /// @notice return the expected MET for ETH
    /// @param _depositAmount ETH.
    /// @return expected MET value for ETH
    function getMetForEthResult(uint _depositAmount) public view returns (uint256) {
        return convertingReturn(WhichToken.Eth, _depositAmount);
    }
}