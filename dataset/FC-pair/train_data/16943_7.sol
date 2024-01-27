contract c16943{
    // command to start the auction
    function startAuction(string _name, uint _duration_secs) public onlyOwner returns (bool success){
        require(started == false);
        started = true;
        startTime = now;
        endTime = now + _duration_secs;
        name = _name;
        return true;
    }
}