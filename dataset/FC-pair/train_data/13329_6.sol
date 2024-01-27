contract c13329{
    // Check for the ability to finalize the round. Constant.
    function hasEnded() public view returns (bool) {
        bool isAdmin = rightAndRoles.onlyRoles(msg.sender,6);
        bool timeReached = now > endTime.add(renewal);
        bool capReached = weiRaised() >= hardCap;
        return (timeReached || capReached || (isAdmin && goalReached())) && isInitialized && !isFinalized;
    }
}