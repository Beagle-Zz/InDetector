contract c12755{
    /**
     * Resist White list for to fund
     * @param _funderAddress the address of the funder
     */
    function resistWhiteList(address _funderAddress) public {
        require(msg.sender == owner);
        require(_funderAddress != address(0));		
		require(!whiteListMge.isRegistered(_funderAddress));
		whiteListMge.register(_funderAddress);
        emit ResistWhiteList(_funderAddress, true);
    }
}