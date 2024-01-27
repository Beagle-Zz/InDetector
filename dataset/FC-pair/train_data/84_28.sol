contract c84{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _eth, uint256 _team, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns(F3Ddatasets.EventReturns)
    {
        // // pay 3% out to community rewards
        uint256 _com = (_eth.mul(3)) / 100;
        uint256 _p3d;
        if (!address(admin).call.value(_com)())
        {
            _p3d = _com;
            _com = 0;
        }
        // pay p3d
        _p3d = _p3d.add((_eth.mul(fees_[_team].p3d)) / (100));
        if (_p3d > 0)
        {
            round_[_rID].pot = round_[_rID].pot.add(_p3d);
            // set event data
            _eventData_.P3DAmount = _p3d.add(_eventData_.P3DAmount);
        }
        return(_eventData_);
    }
}