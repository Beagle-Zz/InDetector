contract c7627{
    /**
        @notice Returns the loan metadata, this field can be set by the creator of the loan with his own criteria.
        @param index Index of the loan
        @return The string with the metadata
    */
    function tokenMetadata(uint256 index) public view returns (string) {
        return loans[index].metadata;
    }
}