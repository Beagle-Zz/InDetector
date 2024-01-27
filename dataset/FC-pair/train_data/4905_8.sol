contract c4905{
    /**
     * Passes execution into virtual function.
     *
     * Can only be called by assigned asset proxy.
     *
     * @return success.
     * @dev function is final, and must not be overridden.
     */
    function __approve(address _spender, uint _value, address _sender) public onlyProxy returns (bool) {
        return _approve(_spender, _value, _sender);
    }
}