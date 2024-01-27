contract c16921{
    /// @dev Internal check to see if a given dad and mom are a valid mating pair for
    ///  breeding via market (this method doesn't check ownership and if mating is allowed).
    function _canMateViaMarketplace(uint40 _momId, uint40 _dadId)
        internal
        view
        returns (bool)
    {
        Cutie storage mom = cuties[_momId];
        Cutie storage dad = cuties[_dadId];
        return _canPairMate(mom, _momId, dad, _dadId);
    }
}