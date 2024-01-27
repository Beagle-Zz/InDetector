contract c16448{
    /**
     * @dev Transfers tokens from one address to another.
     * Overrides the transferFrom() function with modifier that prevents the ability to transfer
     * tokens by holders unitl release time. Only sale agent can transfer tokens unitl release time.
     * @param _from {address} the address to send from.
     * @param _to {address} the address to transfer to.
     * @param _value {uint256} the amount of tokens to be transferred.
     */
    function transferFrom(address _from, address _to, uint256 _value) public whenReleased returns (bool) {
        return super.transferFrom(_from, _to, _value);
    }
}