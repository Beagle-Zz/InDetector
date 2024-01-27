contract c2276{
    /**
     * @dev Allows the current owner or operators to add operators
     * @param _newOperator New operator address
     */
    function addOperator(address _newOperator) public onlyOwner {
        require(
            _newOperator != address(0),
            "Invalid new operator address."
        );
        // Make sure no dups
        require(
            !isOperator[_newOperator],
            "New operator exists."
        );
        // Only allow so many ops
        require(
            operators.length < MAX_OPS,
            "Overflow."
        );
        operators.push(_newOperator);
        isOperator[_newOperator] = true;
        emit OperatorAdded(_newOperator);
    }
}