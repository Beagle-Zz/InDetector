contract c10178{
    /// @dev Returns list of owners.
    /// @return List of owner addresses.
    function getOwners()
        public
        view
        returns (address[])
    {
        return owners;
    }
}