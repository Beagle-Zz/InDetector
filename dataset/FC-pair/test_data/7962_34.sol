contract c7962{
    /// Safety check on _to address to prevent against an unexpected 0x0 default.
    function _addressNotNull(address _to) internal pure returns(bool) {
        return _to != address(0);
    }
}