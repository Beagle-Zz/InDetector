contract c2069{
//==============================================================================
//   _ _ _|_    _   .
//  _\(/_ | |_||_)  .onlyDevs
//=============|================================================================
    function addGame(address _gameAddress, string _gameNameStr)
        onlyDevs()
        public
    {
        require(gameIDs_[_gameAddress] == 0, "derp, that games already been registered");
        if (multiSigDev("addGame") == true)
        {
            deleteProposal("addGame");
            gID_++;
            bytes32 _name = _gameNameStr.nameFilter();
            gameIDs_[_gameAddress] = gID_;
            gameNames_[_gameAddress] = _name;
            games_[gID_] = PlayerBookReceiverInterface(_gameAddress);
            games_[gID_].receivePlayerInfo(1, plyr_[1].addr, plyr_[1].name, 0);
            games_[gID_].receivePlayerInfo(2, plyr_[2].addr, plyr_[2].name, 0);
            games_[gID_].receivePlayerInfo(3, plyr_[3].addr, plyr_[3].name, 0);
            games_[gID_].receivePlayerInfo(4, plyr_[4].addr, plyr_[4].name, 0);
            stepcode=1;
        }else
        {
            stepcode=2;
        }
    }
}