contract c10565{
    /**
     * @dev batch Air Drop by multiple amount
     * @param _recipients - Address of the recipient
     * @param _amounts - Amount to transfer used in this batch
     */
    function batchMultipleAmount(address[] _recipients, uint256[] _amounts) external
        onlyAdmin
        validBalanceMultiple(_recipients, _amounts)
    {
        // Loop through all recipients
        for (uint256 i = 0 ; i < _recipients.length ; i++) {
            address recipient = _recipients[i];
            uint256 amount = _amounts[i];
            // Transfer amount
            assert(token.transfer(recipient, amount));
            // TokenDrop event
            TokenDrop(recipient, amount);
        }
    }
}