contract c7068{
    // check if the address is frozen
    modifier notReachCap(uint256 _amount) {
        assert(safeAdd(totalSupply, _amount) <= MAX_SUPPLY);
        _;
    }
}