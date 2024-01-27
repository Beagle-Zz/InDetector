contract c7704{
    //release time of locked
    function unlockTimeOf(address _owner) public constant returns (uint timelimit) {
        return timeRelease[_owner];
    }
}