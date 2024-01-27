contract c4873{
    /// @dev Only authorized addresses can invoke functions with this modifier.
    modifier onlyAuthorized {
        require(authorized[msg.sender]);
        _;
    }
}