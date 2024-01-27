contract c3880{
    /**
     * Overrides the burn function so that it cannot be called until after
     * transfers have been enabled.
     *
     */
    function burn(uint256 _value) public {
        require(transferEnabled || msg.sender == owner);
        super.burn(_value);
        emit Transfer(msg.sender, address(0x0), _value);
    }
}