contract c2883{
    /// @dev overridden price lifetime logic
    function priceExpired() public view returns (bool) {
        return false;
    }
}