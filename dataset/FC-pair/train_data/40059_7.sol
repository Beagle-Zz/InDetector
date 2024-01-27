contract c40059{
     
    modifier can_cancel(uint id) {
        assert(isActive(id));
        assert(isClosed() || (msg.sender == getOwner(id)));
        _;
    }
}