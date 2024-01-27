contract c10993{
    /**
     * if active balance is not enought. deny transaction
     */
    modifier whenNotLocked(address _from, uint256 _value) {
        require( activeBalanceOf(_from) >= _value );
        _;
    }
}