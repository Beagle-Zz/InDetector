contract c2129{
    /**
     * @dev converts all incoming ethereum to keys.
     * -functionhash- 0x8f38f309 (using ID for affiliate)
     * -functionhash- 0x98a0871d (using address for affiliate)
     * -functionhash- 0xa65b37a1 (using name for affiliate)
     * @param _affCode the ID/address/name of the player who gets the affiliate fee
     * @param _team what team is the player playing for?
     */
    function buyXid(uint256 _affCode, uint256 _team)
        isActivated()
        isHuman()
        isWithinLimits(msg.value)
        public
        payable
    {
        // set up our tx event data and determine if player is new or not
        F3Ddatasets.EventReturns memory _eventData_ = determinePID(_eventData_);
        // fetch player id
        uint256 _pID = pIDxAddr_[msg.sender];
        // get real affid
        _affCode = determineAffID(_pID,_affCode);
        // verify a valid team was selected
        _team = verifyTeam(_team);
        // buy core 
        buyCore(_pID, _affCode, _team, _eventData_);
    }
}