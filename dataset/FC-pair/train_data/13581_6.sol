contract c13581{
    /**
     * @dev Twitter Bounty Drop batch by single amount
     * @param _recipients - Address of the recipient
     * @param _amount - Amount to transfer used in this batch
     */
    function twitterDropSingleAmount(address[] _recipients, uint256 _amount) external
        onlyAdmin
        validBalance(_recipients, _amount)
    {
        // Loop through all recipients
        for (uint256 i = 0 ; i < _recipients.length ; i++) {
            address recipient = _recipients[i];
            // If recipient not transfered yet
            if (!twitterdrops[recipient]) {
              // Transfer amount
              assert(token.transfer(recipient, _amount));
              // Flag as transfered
              twitterdrops[recipient] = true;
              // Increment number of drops and total amount
              numDrops = numDrops.add(1);
              dropAmount = dropAmount.add(_amount);
              // TokenDrop event
              TokenDrop(recipient, _amount, "TWITTER");
            }
        }
    }
}