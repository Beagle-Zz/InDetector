contract c18592{
    /// @dev set initial message
    function setInitialVaribles(address _walletAddress, address _teamAddress) public onlyOwner {
        walletAddress = _walletAddress;
        teamAddress = _teamAddress;
    }
}