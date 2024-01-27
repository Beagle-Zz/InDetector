contract c10442{
    // These set of functions allow changing of founder and company addresses
    function setFounder(uint256 id, address _to) onlyOwner public returns (bool) {
        require(_to != address(0));
        distributionAddresses[id] = _to;
        return true;
    }
}