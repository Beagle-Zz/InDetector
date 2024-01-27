contract c8311{
    /// @notice get amount of items in mapping
    function size(ContentMapping storage self) public view returns (uint) {
        return self.keys.length;
    }
}