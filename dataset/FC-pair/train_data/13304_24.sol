contract c13304{
    // Extend the round time, if provided by the script. Extend the round only for
    // a limited number of days - ROUND_PROLONGATE
    // ***CHECK***SCENARIO***
    // @ Do I have to use the function      no
    // @ When it is possible to call        during active round
    // @ When it is launched automatically  -
    // @ Who can call the function          admins
    function prolong(uint256 _duration) external {
        require(rightAndRoles.onlyRoles(msg.sender,6));
        require(now > startTime && now < endTime.add(renewal) && isInitialized && !isFinalized);
        renewal = renewal.add(_duration);
        require(renewal <= ROUND_PROLONGATE);
    }
}