contract c12531{
    /**
     * @dev transfer token for a specified address before swap
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value)
    public onlyBeforeSwap(_to)
    returns (bool) {
       return super.transfer(_to,_value);
    }
}