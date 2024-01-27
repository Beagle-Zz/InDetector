contract c4905{
    /**
     * Calls back without modifications.
     *
     * @return success.
     * @dev function is virtual, and meant to be overridden.
     */
    function _approve(address _spender, uint _value, address _sender) internal returns (bool) {
        return AssetProxy(proxy).__approve(_spender, _value, _sender);
    }
}