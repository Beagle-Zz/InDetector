contract c10442{
    // This functions returns the last time at which rewards were transferred to a particular address
    function lastTimeOf(address _owner) public view returns (uint256 interval, uint256 time) {
        return (accounts[_owner].lastInterval, ((accounts[_owner].lastInterval).mul(tokenGenInterval)).add(startTime));
    }
}