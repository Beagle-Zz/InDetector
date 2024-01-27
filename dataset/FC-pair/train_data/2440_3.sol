contract c2440{
    /// @notice Admin function for updating all locations
    /// @param _locations Array of location keys
    function setAllLocations(uint[] _locations) onlyOwner public {
        locations = _locations;
    }
}