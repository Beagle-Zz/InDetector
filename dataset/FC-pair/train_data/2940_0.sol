contract c2940{
    // allows execution by the owner only
    modifier onlyOwner {
        assert(msg.sender == owner);
        _;
    }
}