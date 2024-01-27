contract c12251{
    /// @dev Internal check to see if a given sire and matron are a valid mating pair. DOES NOT
    ///  check ownership permissions (that is up to the caller).
    /// @param _matron A reference to the Zodiac struct of the potential matron.
    /// @param _matronId The matron's ID.
    /// @param _sire A reference to the Zodiac struct of the potential sire.
    /// @param _sireId The sire's ID
    function _isValidMatingPair(
        Zodiac storage _matron,
        uint256 _matronId,
        Zodiac storage _sire,
        uint256 _sireId
    )
        private
        view
        returns(bool)
    {
        // Must be same Zodiac type
        if (_matron.zodiacType != _sire.zodiacType) {
            return false;
        }
        // A Zodiac can't breed with itself!
        if (_matronId == _sireId) {
            return false;
        }
        // zodiacs can't breed with their parents.
        if (_matron.matronId == _sireId || _matron.sireId == _sireId) {
            return false;
        }
        if (_sire.matronId == _matronId || _sire.sireId == _matronId) {
            return false;
        }
        // We can short circuit the sibling check (below) if either Zodiac is
        // gen zero (has a matron ID of zero).
        if (_sire.matronId == 0 || _matron.matronId == 0) {
            return true;
        }
        // zodiacs can't breed with full or half siblings.
        if (_sire.matronId == _matron.matronId || _sire.matronId == _matron.sireId) {
            return false;
        }
        if (_sire.sireId == _matron.matronId || _sire.sireId == _matron.sireId) {
            return false;
        }
        // Everything seems cool! Let's get DTF.
        return true;
    }
}