contract c8624{
    /// accept the ownership
    function acceptNewOwner() public returns(bool) {
        require(msg.sender == newOwner);
        emit updateOwner(owner, newOwner);
        owner = newOwner;
        return true;
    }
}