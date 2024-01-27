contract c3254{
    /**
     * @dev distributes eth based on fees to gen and pot
     */
    function distributeInternal(uint256 _pID, uint256 _eth, uint256 _keys, RSdatasets.EventReturns memory _eventData_)
        private
        returns(RSdatasets.EventReturns)
    {
        // calculate gen share
        uint256 _gen = (_eth.mul(fees_)) / 100;
        // toss 5% into airdrop pot 
        uint256 _air = (_eth / 20);
        airDropPot_ = airDropPot_.add(_air);
        // calculate pot (20%) 
        uint256 _pot = (_eth.mul(20) / 100);
        // distribute gen share (thats what updateMasks() does) and adjust
        // balances for dust.
        uint256 _dust = updateMasks(_pID, _gen, _keys);
        if (_dust > 0)
            _gen = _gen.sub(_dust);
        // add eth to pot
        round_.pot = _pot.add(_dust).add(round_.pot);
        // set up event data
        _eventData_.genAmount = _gen.add(_eventData_.genAmount);
        _eventData_.potAmount = _pot;
        return(_eventData_);
    }
}