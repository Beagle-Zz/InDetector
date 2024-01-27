contract c1912{
    /* ServiceAllowance */
    /// @notice Restricts transfers only for:
    /// 1) oracle and only ATx tokens;
    /// 2) from itself to holder
    function isTransferAllowed(address _from, address _to, address, address _token, uint) public view returns (bool) {
        if (_token == token &&
            ((oracles[_from] && _to == address(this)) ||
            (_from == address(this) && whitelist[_to]))
        ) {
            return true;
        }
    }
}