contract c4769{
    /* Returns the total amount of tokens ever burned */
    function amountBurned() constant returns (uint256 amountBurned) {
        return _initialSupply - _currentSupply;
    }
}