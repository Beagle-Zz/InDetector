contract c7704{
    //balance of locked
    function lockedOf(address _owner) public constant returns (uint256 balance) {
        return lockedBalance[_owner];
    }
}