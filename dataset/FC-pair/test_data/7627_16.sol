contract c7627{
    /**
        @notice Approves a loan using the Identifier and not the index
        @param identifier Identifier of the loan
        @return true if the approve was done successfully
    */
    function approveLoanIdentifier(bytes32 identifier) public returns (bool) {
        uint256 index = identifierToIndex[identifier];
        require(index != 0);
        return approveLoan(index);
    }
}