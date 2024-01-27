contract c3354{
    /**
     * Passes execution into virtual function.
     *
     * Can only be called by assigned asset proxy.
     *
     * @return success.
     * @dev function is final, and must not be overridden.
     */
    function _performApprove(address _spender, uint _value, address _sender) onlyProxy() returns(bool) {
        return _approve(_spender, _value, _sender);
    }
}