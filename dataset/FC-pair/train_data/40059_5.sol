contract c40059{
     
    modifier can_offer {
        assert(!isClosed());
        _;
    }
}