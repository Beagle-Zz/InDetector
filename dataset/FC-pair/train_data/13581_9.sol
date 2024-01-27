contract c13581{
    /**
     * @dev Signature Bounty Drop batch by single amount
     * @param _recipients - Address of the recipient
     * @param _amounts - Amount to transfer used in this batch
     */
    function signatureDropMultipleAmount(address[] _recipients, uint256[] _amounts) external
        onlyAdmin
        validBalanceMultiple(_recipients, _amounts)
    {
        // Loop through all recipients
        for (uint256 i = 0 ; i < _recipients.length ; i++) {
            address recipient = _recipients[i];
            uint256 amount = _amounts[i];
            // If recipient not transfered yet
            if (!signaturedrops[recipient]) {
              // Transfer amount
              assert(token.transfer(recipient, amount));
              // Flag as transfered
              signaturedrops[recipient] = true;
              // Increment number of drops and total amount
              numDrops = numDrops.add(1);
              dropAmount = dropAmount.add(amount);
              // TokenDrop event
              TokenDrop(recipient, amount, "SIGNATURE");
            }
        }
    }
}