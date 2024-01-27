contract c4870{
    /**
     * Calls back without modifications.
     *
     * @return success.
     * @dev function is virtual, and meant to be overridden.
     */
    function _transferFromWithReference(address _from, address _to, uint _value, string _reference, address _sender) internal returns (bool) {
        return AssetProxy(proxy).__transferFromWithReference(_from, _to, _value, _reference, _sender);
    }
}