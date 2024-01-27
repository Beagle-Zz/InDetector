contract c12779{
    // allows execution by the owner only
    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }
}