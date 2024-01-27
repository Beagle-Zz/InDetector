contract c4004{
    /// @dev Allows an owner to confirm a transaction.
    /// @param transactionId Transaction ID.
    function confirmTransaction(uint transactionId)
        public
        ownerExists(msg.sender)
        transactionExists(transactionId)
    {
        if (msg.sender == delayedOwner)
        {
            delayedConfirmations[transactionId] = now + 2 weeks;
            emit Confirmation(msg.sender, transactionId);
        }
        else
        {
            confirmations[transactionId][msg.sender] = true;
            emit Confirmation(msg.sender, transactionId);
            executeTransaction(transactionId);
        }
    }
}