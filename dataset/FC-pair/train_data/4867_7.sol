contract c4867{
    /* MODIFIERS */
    /// @dev Only profiterole contract allowed to invoke guarded functions
    modifier onlyProfiterole {
        require(profiterole == msg.sender);
        _;
    }
}