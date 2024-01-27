contract c11514{
    /**
	 * @dev freeze the tokens in the deposit address
     *
     * @param _deposit the deposit address
     * @param _value the amount of tokens need to be frozen
	 */
    function freezeTokens(address _deposit, uint256 _value) onlyOwner public returns (bool) {
        require(_deposit != address(0));
        frozenDeposits[_deposit] = true;
        depositRepos[_deposit].frozen = _value;
        emit FrozenTokens(_deposit, _value);
        return true;
    }
}