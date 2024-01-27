contract c8844{
    /// @dev we can create LinglongCats with different generations. Only callable by COO
    /// @param _genes The encoded genes of the LinglongCat to be created, any value is accepted
    /// @param _owner The future owner of the created LinglongCat. Default to contract COO
    /// @param _time The birth time of LinglongCat
    /// @param _cooldownIndex The cooldownIndex of LinglongCat
    function createDefaultGen0LinglongCat(uint256 _genes, address _owner, uint256 _time, uint256 _cooldownIndex) external onlyCOO {
        require(_time == uint256(uint64(_time)));
        require(_cooldownIndex == uint256(uint16(_cooldownIndex)));
        require(_time > 0);
        require(_cooldownIndex >= 0 && _cooldownIndex <= 13);
        address LinglongCatOwner = _owner;
        if (LinglongCatOwner == address(0)) {
            LinglongCatOwner = cooAddress;
        }
        require(defaultCreatedCount < DEFAULT_CREATION_LIMIT);
        defaultCreatedCount++;
        _createLinglongCatWithTime(0, 0, 0, _genes, LinglongCatOwner, _time, _cooldownIndex);
    }
}