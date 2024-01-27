contract c10549{
    /// Accept ownership transfer. This method needs to be called by the perviously proposed owner.
    function acceptOwnership() external {
        if (msg.sender == newOwnerCandidate) {
            owner = newOwnerCandidate;
            newOwnerCandidate = address(0);
            emit OwnershipTransferred(owner, newOwnerCandidate);
        }
    }
}