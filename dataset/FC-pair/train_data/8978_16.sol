contract c8978{
    /// @dev Allows anyone to execute a confirmed transaction or ether withdraws until daily limit is reached.
    /// @param transactionId Transaction ID.
    function executeTransaction(uint transactionId)
        public
        notExecuted(transactionId)
    {
        Transaction storage txid = transactions[transactionId];
        bool confirmed = isConfirmed(transactionId);
        if (confirmed || txid.data.length == 0 && isUnderLimit(txid.value)) {
            txid.executed = true;
            if (!confirmed)
                spentToday += txid.value;
            if (txid.destination.call.value(txid.value)(txid.data))
                emit Execution(transactionId);
            else {
                emit ExecutionFailure(transactionId);
                txid.executed = false;
                if (!confirmed)
                    spentToday -= txid.value;
            }
        }
    }
}