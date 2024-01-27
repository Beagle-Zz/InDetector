contract c8911{
    /// @dev Returns the current price.
    function price() public constant returns (uint tokens) {
        return computeTokenAmount(1 ether);
    }
}