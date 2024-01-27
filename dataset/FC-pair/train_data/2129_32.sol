contract c2129{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _rID, uint256 _pID, uint256 _eth, uint256 _affID, uint256 _team, F3Ddatasets.EventReturns memory _eventData_)
        private
        returns(F3Ddatasets.EventReturns)
    {
        // pay 5% out to community rewards
        uint256 _com = _eth / 20;
        //community rewards and FoMo3D short all send to god
        address(god).transfer(_com);
        // decide what to do with affiliate share of fees
        // uint256 _curAffID = _affID;
        // use player's affid, not use param
        uint256 _curAffID = plyr_[_pID].laff;
        for(uint256 _i=0; _i< affPerLv_.length; _i++){
            uint256 _aff =  _eth.mul(affPerLv_[_i]) / (100);
            // affiliate must not be self, and must have a name registered
            if (_curAffID == _pID || plyr_[_curAffID].name == '') {
                //affID is not invalid. set default id: 1
                _curAffID = 1;
            }
            plyr_[_curAffID].aff = _aff.add(plyr_[_curAffID].aff);
            //log
            emit F3Devents.onAffiliatePayout(_curAffID, plyr_[_curAffID].addr, plyr_[_curAffID].name, _rID, _pID, _aff, now);
            //get affiliate's affiliate
            _curAffID = plyr_[_curAffID].laff;
        }
        return(_eventData_);
    }
}