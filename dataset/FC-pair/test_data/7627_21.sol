contract c7627{
    /**
        @notice Destroys a loan using the signature and not the Index
        @param identifier Identifier of the loan
        @return true if the destroy was done successfully
    */
    function destroyIdentifier(bytes32 identifier) public returns (bool) {
        uint256 index = identifierToIndex[identifier];
        require(index != 0);
        return destroy(index);
    }
}