contract c16448{
    /**
     * @dev Transfers tokens to specified address.
     * Overrides the transfer() function with modifier that prevents the ability to transfer
     * tokens by holders unitl release time. Only sale agent can transfer tokens unitl release time.
     * @param _to {address} the address to transfer to.
     * @param _value {uint256} the amount of tokens to be transferred.
     */
    function transfer(address _to, uint256 _value) public whenReleased returns (bool) {
        return super.transfer(_to, _value);
    }
}