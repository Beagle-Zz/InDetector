contract c4769{
    /* Returns the total amount of tokens in supply */
    function currentSupply() constant returns (uint256 currentSupply) {
        return _currentSupply;
    }
}