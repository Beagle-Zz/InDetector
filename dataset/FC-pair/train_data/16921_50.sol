contract c16921{
    /// @notice Grants approval to another user to sire with one of your Cuties.
    /// @param _addr The address that will be able to sire with your Cutie. Set to
    ///  address(0) to clear all breeding approvals for this Cutie.
    /// @param _dadId A Cutie that you own that _addr will now be able to dad with.
    function approveBreeding(address _addr, uint40 _dadId) public whenNotPaused
    {
        require(_isOwner(msg.sender, _dadId));
        sireAllowedToAddress[_dadId] = _addr;
        emit BreedingApproval(msg.sender, _addr, _dadId);
    }
}