contract c3390{
    /**
     * Passes execution into virtual function.
     *
     * Can only be called by assigned asset proxy.
     *
     * @return success.
     * @dev function is final, and must not be overridden.
     */
    function _performTransferWithReference(address _to, uint _value, string _reference, address _sender) onlyProxy() returns(bool) {
        if (isICAP(_to)) {
            return _transferToICAPWithReference(bytes32(_to) << 96, _value, _reference, _sender);
        }
        return _transferWithReference(_to, _value, _reference, _sender);
    }
}