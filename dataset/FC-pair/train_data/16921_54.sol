contract c16921{
    /// @notice Checks to see if two cuties can breed together (checks both
    ///  ownership and breeding approvals, but does not check if both cuties are ready for
    ///  breeding).
    /// @param _momId The ID of the proposed mom.
    /// @param _dadId The ID of the proposed dad.
    function canBreedWith(uint40 _momId, uint40 _dadId)
        public
        view
        returns(bool)
    {
        require(_momId > 0);
        require(_dadId > 0);
        Cutie storage mom = cuties[_momId];
        Cutie storage dad = cuties[_dadId];
        return _canPairMate(mom, _momId, dad, _dadId) && _isBreedingPermitted(_dadId, _momId);
    }
}