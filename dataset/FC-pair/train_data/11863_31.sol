contract c11863{
    /**
	 * @dev get deposit balance and frozen amount by using the deposit address
     *
     * @param _deposit the deposit contract address
	 */
    function getDepositInfo(address _deposit) onlyOwner public view returns (uint256, uint256) {
        require(_deposit != address(0));
        uint256 _balance = tk.balanceOf(_deposit);
        uint256 frozenAmount = depositRepos[_deposit].frozen;
        // depositRepos[_deposit].balance = _balance;
        return (_balance, frozenAmount);
    }
}