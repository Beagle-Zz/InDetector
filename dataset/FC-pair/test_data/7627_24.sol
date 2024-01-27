contract c7627{
    /**
        @notice Transfers the loan to an address, only if the current owner is the "from" address
        @dev Required for ERC-721 compliance
        @param from Current owner of the loan
        @param to New owner of the loan
        @param index Index of the loan
        @return true if the transfer was successfull
    */
    function transferFrom(address from, address to, uint256 index) public returns (bool) {
        require(loans[index].lender == from);
        return transfer(to, index);
    }
}