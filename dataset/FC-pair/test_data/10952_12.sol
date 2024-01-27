contract c10952{
    // allows execution by either the owner or the manager only
    modifier ownerOrManagerOnly {
        require(msg.sender == owner || msg.sender == manager);
        _;
    }
}