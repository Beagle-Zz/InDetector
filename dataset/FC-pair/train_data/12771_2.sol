contract c12771{
    // allows execution by the owner only
    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }
}