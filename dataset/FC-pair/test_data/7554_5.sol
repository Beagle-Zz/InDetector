contract c7554{
    /// @dev updates the priceFeedSource
    /// @param _owner address of owner
    function updateCurator(
        address _owner
    )
        public
        onlyOwner()
    {
        owner = _owner;
    }
}