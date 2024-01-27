contract c40239{
     
    modifier can_offer() {
        assert(!isClosed());
        _;
    }
}