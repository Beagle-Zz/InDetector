contract c7497{
    /// @dev Set minter. Only the creator of this contract can call this.
    /// @param newMinter The new address authorized to mint this token
    function setMinter(address newMinter)
        public
        onlyCreator()
    {
        minter = newMinter;
    }
}