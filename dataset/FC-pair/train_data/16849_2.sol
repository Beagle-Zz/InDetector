contract c16849{
    /// @notice Can only be called by the `newOwnerCandidate`, accepts the
    ///  transfer of ownership
    function acceptOwnership() public {
        require(msg.sender == newOwnerCandidate);
        address oldOwner = owner;
        owner = newOwnerCandidate;
        newOwnerCandidate = 0x0;
        OwnershipTransferred(oldOwner, owner);
    }
}