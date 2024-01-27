contract c7627{
    /**
        @notice Returns the loan metadata, hashed with keccak256.
        @dev This emthod is useful to evaluate metadata from a smart contract.
        @param index Index of the loan
        @return The metadata hashed with keccak256
    */
    function tokenMetadataHash(uint256 index) public view returns (bytes32) {
        return keccak256(loans[index].metadata);
    }
}