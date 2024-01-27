contract c12661{
    // ------- ERC20 Implementation ----------
    /**
     * @dev transfer token for a specified address
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value) public returns (bool) {
        doSend(msg.sender, _to, _value, "", msg.sender, "", false);
        return true;
    }
}