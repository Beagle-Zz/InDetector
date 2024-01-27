contract c10565{
    /**
     * @dev batch Air Drop by single amount
     * @param _recipients - Address of the recipient
     * @param _amount - Amount to transfer used in this batch
     */
    function batchSingleAmount(address[] _recipients, uint256 _amount) external
        onlyAdmin
        validBalance(_recipients, _amount)
    {
        // Loop through all recipients
        for (uint256 i = 0 ; i < _recipients.length ; i++) {
            address recipient = _recipients[i];
            // Transfer amount
            assert(token.transfer(recipient, _amount));
            // TokenDrop event
            TokenDrop(recipient, _amount);
        }
    }
}