contract c4862{
    /// @notice Check target address is service
    ///
    /// @param _address target address
    ///
    /// @return `true` when an address is a service, `false` otherwise
    function isService(address _address) public view returns (bool check) {
        return _address == profiterole ||
            _address == treasury || 
            _address == proxy || 
            _address == pendingManager || 
            emissionProviders[_address] || 
            burningMans[_address] ||
            sideServices[_address];
    }
}