contract c2276{
    /**
     * @dev Allows the current owner or operators to remove operator
     * @param _operator Address of the operator to be removed
     */
    function removeOperator(address _operator) public onlyOwner {
        // Make sure operators array is not empty
        require(
            operators.length > 0,
            "No operator."
        );
        // Make sure the operator exists
        require(
            isOperator[_operator],
            "Not an operator."
        );
        // Manual array manipulation:
        // - replace the _operator with last operator in array
        // - remove the last item from array
        address lastOperator = operators[operators.length - 1];
        for (uint i = 0; i < operators.length; i++) {
            if (operators[i] == _operator) {
                operators[i] = lastOperator;
            }
        }
        operators.length -= 1; // remove the last element
        isOperator[_operator] = false;
        emit OperatorRemoved(_operator);
    }
}