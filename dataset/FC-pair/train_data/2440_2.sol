contract c2440{
    /// @notice Number of locations in the hunt
    /// @dev Useful for testing, since public arrays don't expose length
    /// @return length of locations array
    function locationsLength() public view returns (uint) {
        return locations.length;
    }
}