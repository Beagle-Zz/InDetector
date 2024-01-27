contract c10549{
	/**
     * Create investition 
     */
	function invest(uint32 _playerId, uint32 _investorId, uint64 _amount, uint16 _userFee) external onlyServer {
		require(_amount > 0 && _userFee > 0);
		investTerms[_investorId][_playerId] = InvestTerm(_amount, _userFee);
	}
}