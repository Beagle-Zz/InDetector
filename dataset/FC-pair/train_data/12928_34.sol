contract c12928{
    /// @dev Internal check to see if a given sire and matron are a valid mating pair for
    ///  breeding via auction (i.e. skips ownership and siring approval checks).
    function _canBreedWithViaAuction(uint256 _matronId, uint256 _sireId)
        internal
        view
        returns (bool)
    {
        Dog storage matron = dogs[_matronId];
        Dog storage sire = dogs[_sireId];
        return _isValidMatingPair(matron, _matronId, sire, _sireId);
    }
}