contract c7892{
    // external agent for candy policies
    modifier onlyAgent {
        assert(msg.sender == agent);
        _;
    }
}