contract c7554{
    /// @dev change owner/creator of the contract. Only the creator/owner of this contract can call this.
    /// @param newOwner The new address, which should become the owner
    function setNewOwner(address newOwner)
        public
        onlyCreator()
    {
        creator = newOwner;
    }
}