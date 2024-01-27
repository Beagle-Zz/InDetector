contract c2144{
    /**
     * @dev transfer token for a specified address
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value) public
    onlyPayloadSize(2)
    returns (bool success) {
        success = controller.transfer(msg.sender, _to, _value);
        if (success) {
            emit Transfer(msg.sender, _to, _value);
        }
    }
}