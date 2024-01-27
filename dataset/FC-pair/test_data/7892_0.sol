contract c7892{
    // allows execution by the owner only
    modifier onlyOwner {
        assert(msg.sender == owner);
        _;
    }
}