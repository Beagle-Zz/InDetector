contract c13400{
    /// @notice Allows the new owner to accept ownership of the contract.
    /// @return true/false
    function acceptOwnership() public returns (bool) {
        require(msg.sender == newOwner);
        emit OwnershipChanged(owner, newOwner);
        owner = newOwner;
        return true;
    }
}