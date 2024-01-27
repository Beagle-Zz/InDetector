contract c11792{
    /**
     * @dev overrides transfer function with modifier to prevent from transfer with invalid address
     * @param _to The address to transfer to
     * @param _value The amount to be transferred
     */
    function transfer(address _to, uint _value) public 
    validAddress(_to) 
    onlyWhenTransferable
    returns (bool) {
        return super.transfer(_to, _value);
    }
}