contract c7627{
    /**
        @notice Returns true if the _operator can transfer the loans of the _owner
        @dev Required for ERC-721 compliance 
    */
    function isApprovedForAll(address _owner, address _operator) public view returns (bool) {
        return operators[_owner][_operator];
    }
}