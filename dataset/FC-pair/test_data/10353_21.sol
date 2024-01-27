contract c10353{
    /**
     * @dev overrides transfer function with modifier to prevent from transfer with invalid address
     * @param _from The address to transfer from.
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transferFrom(address _from, address _to, uint _value) public 
    validAddress(_to) 
    onlyWhenTransferable
    returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}