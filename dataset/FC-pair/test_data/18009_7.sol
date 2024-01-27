contract c18009{
    // allows execution by the owner only
    modifier ownerOnly {
        assert(msg.sender == owner);
        _;
    }
}