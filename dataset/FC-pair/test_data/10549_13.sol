contract c10549{
	/**
     * Delete investition 
     */
	function deleteInvest(uint32 _playerId, uint32 _investorId) external onlyServer {
		delete investTerms[_investorId][_playerId];
	}
}