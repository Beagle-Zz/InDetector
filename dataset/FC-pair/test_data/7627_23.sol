contract c7627{
    /**
        @notice Transfers the loan to the msg.sender, the msg.sender must be approved using the "approve" method.
        @dev Required for ERC-721 compliance
        @param _index Index of the loan
        @return true if the transfer was successfull
    */
    function takeOwnership(uint256 _index) public returns (bool) {
        return transfer(msg.sender, _index);
    }
}