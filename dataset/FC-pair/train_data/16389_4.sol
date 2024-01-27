contract c16389{
    /// @dev modifier to allow actions only when the contract is paused
    modifier whenPaused {
        require(paused);
        _;
    }
}