contract c216{
    /// @dev requires the address to be non null
    modifier validAddress(address addr) {
        require(addr != address(0),"Address is zero");
        _;
    }
}