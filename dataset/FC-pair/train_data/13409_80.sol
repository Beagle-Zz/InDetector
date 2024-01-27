contract c13409{
    /// @notice only owner can add destination chains
    /// @param _chainName string of destination blockchain name
    /// @param _contractAddress address of destination MET token to import to
    function addDestinationChain(bytes8 _chainName, address _contractAddress) 
        public onlyOwner returns (bool) 
    {
        require(_chainName != 0 && _contractAddress != address(0));
        destinationChains[_chainName] = _contractAddress;
        return true;
    }
}