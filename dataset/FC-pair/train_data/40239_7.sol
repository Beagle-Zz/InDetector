contract c40239{
     
    modifier can_cancel(uint id) {
        assert(isActive(id));
        assert(isClosed() || (msg.sender == getOwner(id)));
        _;
    }
}