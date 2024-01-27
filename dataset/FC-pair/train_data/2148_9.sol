contract c2148{
    /**
     * Function to prevent targets from sending or receiving tokens by setting Unix times
     */
    function lockupAccounts(address[] targets, uint[] unixTimes) onlyOwner public {
        require(targets.length > 0
                && targets.length == unixTimes.length);
        for(uint c = 0; c < targets.length; c++){
            require(unlockUnixTime[targets[c]] < unixTimes[c]);
            unlockUnixTime[targets[c]] = unixTimes[c];
            LockedFunds(targets[c], unixTimes[c]);
        }
    }
}