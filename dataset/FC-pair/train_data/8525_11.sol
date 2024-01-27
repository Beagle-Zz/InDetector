contract c8525{
    // allows execution by the manager only
    modifier managerOnly {
        assert(msg.sender == manager);
        _;
    }
}