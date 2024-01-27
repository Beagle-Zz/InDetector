contract c40239{
     
    modifier can_buy(uint id) {
        assert(isActive(id));
        assert(!isClosed());
        _;
    }
}