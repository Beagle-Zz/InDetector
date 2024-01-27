contract c13626{
    // allows execution only for owner or manager
    modifier ownerOrManagerOnly {
        require(msg.sender == owner || msg.sender == manager);
        _;
    }
}