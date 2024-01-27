contract c2538{
    /**
     * @dev players, use this to push your player profile to all registered games.
     * -functionhash- 0x0c6940ea
     */
    function addMeToAllGames()
        isHuman()
        public
    {
        address _addr = msg.sender;
        uint256 _pID = pIDxAddr_[_addr];
        require(_pID != 0, "hey there buddy, you dont even have an account");
        uint256 _laff = plyr_[_pID].laff;
        uint256 _totalNames = plyr_[_pID].names;
        bytes32 _name = plyr_[_pID].name;
        for (uint256 i = 1; i <= gID_; i++)
        {
            games_[i].receivePlayerInfo(_pID, _addr, _name, _laff);
            if (_totalNames > 1)
                for (uint256 ii = 1; ii <= _totalNames; ii++)
                    games_[i].receivePlayerNameList(_pID, plyrNameList_[_pID][ii]);
        }
    }
}