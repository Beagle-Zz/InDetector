contract c1589{
    /*
        @dev verifies that an amount is greater than zero
    */
    modifier greaterThanZero(uint256 _amount) {
        require(_amount > 0);
        _;
    }
}