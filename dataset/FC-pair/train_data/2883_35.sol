contract c2883{
    /// @dev check that address is valid
    modifier validAddress(address addr) {
        require(addr != address(0));
        _;
    }
}