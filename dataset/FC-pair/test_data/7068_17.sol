contract c7068{
    // check if the address is frozen
    modifier notFrozen(address _address) {
        assert(isFrozen[_address] == false);
        _;
    }
}