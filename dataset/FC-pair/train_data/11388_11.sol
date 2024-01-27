contract c11388{
    // allows execution by the manager only
    modifier managerOnly {
        assert(msg.sender == manager);
        _;
    }
}