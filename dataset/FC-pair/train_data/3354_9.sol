contract c3354{
    /**
     * Calls back without modifications.
     *
     * @return success.
     * @dev function is virtual, and meant to be overridden.
     */
    function _transferFromToICAPWithReference(address _from, bytes32 _icap, uint _value, string _reference, address _sender) internal returns(bool) {
        return proxy._forwardTransferFromToICAPWithReference(_from, _icap, _value, _reference, _sender);
    }
}