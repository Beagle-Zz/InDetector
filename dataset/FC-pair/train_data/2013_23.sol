contract c2013{
    /// @notice Proxy function which allows sending of transactions
    /// in behalf of the contract
    function executeTransaction(
        address destination,
        uint value,
        bytes data
    )
        public
        onlyOwner
    {
        if (destination.call.value(value)(data))
            emit Execution(destination,value,data);
        else
            emit ExecutionFailure(destination,value,data);
    }
}