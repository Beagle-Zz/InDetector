contract c11074{
    /// @notice Sets Proxy contract address for a particular asset.
    ///
    /// Can be set only once for each asset, and only by contract owner.
    ///
    /// @param _proxyAddress Proxy contract address.
    /// @param _symbol asset symbol.
    ///
    /// @return success.
    function setProxy(address _proxyAddress, bytes32 _symbol) public onlyOneOfContractOwners returns (uint) {
        if (proxies[_symbol] != 0x0) {
            return ATX_PLATFORM_PROXY_ALREADY_EXISTS;
        }
        proxies[_symbol] = _proxyAddress;
        return OK;
    }
}