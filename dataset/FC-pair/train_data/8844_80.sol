contract c8844{
    /// @dev we can create LinglongCats with different generations. Only callable by COO
    /// @param _matronId The LinglongCat ID of the matron of this LinglongCat
    /// @param _sireId The LinglongCat ID of the sire of this LinglongCat
    /// @param _genes The encoded genes of the LinglongCat to be created, any value is accepted
    /// @param _owner The future owner of the created LinglongCat. Default to contract COO
    /// @param _time The birth time of LinglongCat
    /// @param _cooldownIndex The cooldownIndex of LinglongCat
    function createDefaultLinglongCat(uint256 _matronId, uint256 _sireId, uint256 _genes, address _owner, uint256 _time, uint256 _cooldownIndex) external onlyCOO {
        require(_matronId == uint256(uint32(_matronId)));
        require(_sireId == uint256(uint32(_sireId)));
        require(_time == uint256(uint64(_time)));
        require(_cooldownIndex == uint256(uint16(_cooldownIndex)));
        require(_time > 0);
        require(_cooldownIndex >= 0 && _cooldownIndex <= 13);
        address LinglongCatOwner = _owner;
        if (LinglongCatOwner == address(0)) {
            LinglongCatOwner = cooAddress;
        }
        require(_matronId > 0);
        require(_sireId > 0);
        // Grab a reference to the matron in storage.
        LinglongCat storage matron = LinglongCats[_matronId];
        // Grab a reference to the sire in storage.
        LinglongCat storage sire = LinglongCats[_sireId];
        // Determine the higher generation number of the two parents
        uint16 parentGen = matron.generation;
        if (sire.generation > matron.generation) {
            parentGen = sire.generation;
        }
        _createLinglongCatWithTime(_matronId, _sireId, parentGen + 1, _genes, LinglongCatOwner, _time, _cooldownIndex);
    }
}