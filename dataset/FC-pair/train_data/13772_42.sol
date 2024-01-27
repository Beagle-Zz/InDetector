contract c13772{
    /// @dev Internal check to see if a given sire and matron are a valid mating pair for
    ///  breeding via auction (i.e. skips ownership and siring approval checks).
    function _canBreedWithViaAuction(uint256 _matronId, uint256 _sireId)
        internal
        view
        returns (bool)
    {
        EtherDog storage matron = EtherDogs[_matronId];
        EtherDog storage sire = EtherDogs[_sireId];
        return _isValidMatingPair(matron, _matronId, sire, _sireId);
    }
}