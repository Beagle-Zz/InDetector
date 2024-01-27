contract c10769{
    /**
	 * @dev freeze the tokens in the deposit address
     *
     * @param _deposit the deposit address
     * @param _freeze to freeze or release
     * @param _value the amount of tokens need to be frozen
	 */
    function freezeTokens(address _deposit, bool _freeze, uint256 _value) onlyOwner public returns (bool) {
        require(_deposit != address(0));
        frozenDeposits[_deposit] = _freeze;
        if (_freeze) {
            depositRepos[_deposit].frozen = depositRepos[_deposit].frozen.add(_value);
        } else {
            require(_value <= depositRepos[_deposit].frozen);
            depositRepos[_deposit].frozen = depositRepos[_deposit].frozen.sub(_value);
        }
        emit FrozenTokens(_deposit, _freeze, _value);
        return true;
    }
}