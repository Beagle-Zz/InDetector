contract c13304{
    // Initializing the round. Available to the manager. After calling the function,
    // the Manager loses all rights: Manager can not change the settings (setup), change
    // wallets, prevent the beginning of the round, etc. You must call a function after setup
    // for the initial round (before the Round1 and before the Round2)
    // @ Do I have to use the function      yes
    // @ When it is possible to call        before each round
    // @ When it is launched automatically  -
    // @ Who can call the function          admins
    function initialize() public {
        require(rightAndRoles.onlyRoles(msg.sender,6));
        // If not yet initialized
        require(!isInitialized);
        begin();
        // And the specified start time has not yet come
        // If initialization return an error, check the start date!
        require(now <= startTime);
        initialization();
        emit Initialized();
        renewal = 0;
        isInitialized = true;
        canFirstMint = false;
    }
}