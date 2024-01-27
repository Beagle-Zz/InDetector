contract c4890{
    /**
     * Calls back without modifications.
     *
     * @return success.
     * @dev function is virtual, and meant to be overridden.
     */
    function _transferWithReference(address _to, uint _value, string _reference, address _sender) internal returns (bool) {
        return AssetProxy(proxy).__transferWithReference(_to, _value, _reference, _sender);
    }
}