contract c4890{
    /**
     * Passes execution into virtual function.
     *
     * Can only be called by assigned asset proxy.
     *
     * @return success.
     * @dev function is final, and must not be overridden.
     */
    function __transferWithReference(address _to, uint _value, string _reference, address _sender) public onlyProxy returns (bool) {
        return _transferWithReference(_to, _value, _reference, _sender);
    }
}