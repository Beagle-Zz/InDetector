contract c10131{
	/**
	 * @notice Registers how many tokens have each investor and how many ethers they spent (When ICOing through PayIn this function is not called)
	 */
	function deposit(address _investor, uint256 _tokenAmount) onlyICOContract public payable returns (bool) {
		if (state != State.Active) {
			error('deposit: state != State.Active');
			return false;
		}
		deposited[_investor] = deposited[_investor].add(msg.value);
		tokensAcquired[_investor] = tokensAcquired[_investor].add(_tokenAmount);
		return true;
	}
}