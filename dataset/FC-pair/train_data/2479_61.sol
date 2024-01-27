contract c2479{
    /**
     * @notice Queries totalSupply as of a defined checkpoint
     * @param _checkpointId Checkpoint ID to query
     * @return uint256
     */
    function totalSupplyAt(uint256 _checkpointId) public view returns(uint256) {
        return getValueAt(checkpointTotalSupply, _checkpointId, totalSupply());
    }
}