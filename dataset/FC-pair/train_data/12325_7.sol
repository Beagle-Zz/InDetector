contract c12325{
    /// @dev Allows anyone to execute a confirmed transaction.
    /// @param transactionId Transaction ID.
    function executeTransaction(uint transactionId)
        public
        notExecuted(transactionId)
    {
        if (isConfirmed(transactionId)) {
            // Transaction tx = transactions[transactionId];
            transactions[transactionId].executed = true;
            // tx.executed = true;
            if (transactions[transactionId].destination.call.value(transactions[transactionId].value)(transactions[transactionId].data)) {
                emit Execution(transactionId);
            } else {
                emit ExecutionFailure(transactionId);
                transactions[transactionId].executed = false;
            }
        }
    }
}