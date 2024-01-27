contract c7042{
    /**
     * @dev Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address _from, address _to, uint256 _value) public erc20Allowed returns (bool) {
        return _transferFrom(msg.sender, _from, _to, _value);
    }
}