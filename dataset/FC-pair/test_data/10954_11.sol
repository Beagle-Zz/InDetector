contract c10954{
    // allows execution by the manager only
    modifier managerOnly {
        assert(msg.sender == manager);
        _;
    }
}