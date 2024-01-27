contract c13403{
    /// @notice only owner can remove destination chains
    /// @param _chainName string of destination blockchain name
    function removeDestinationChain(bytes8 _chainName) public onlyOwner returns (bool) {
        require(_chainName != 0);
        require(destinationChains[_chainName] != address(0));
        destinationChains[_chainName] = address(0);
        return true;   
    }
}