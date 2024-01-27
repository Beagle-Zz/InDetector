contract c7214{
    /// @dev override inherited update function to prevent manual update from authority
    function update() external { revert(); }
}