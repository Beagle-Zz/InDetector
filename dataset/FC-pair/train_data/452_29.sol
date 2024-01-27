contract c452{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeInvest(uint256 _pID, uint256 _aff_eth, uint256 _affID)
        private
        returns(uint256)
    {
        uint256 _p3d;
        uint256 _aff;
        uint256 _aff_2;
        uint256 _aff_3;
        uint256 _affID_1;
        uint256 _affID_2;
        uint256 _affID_3;
        _p3d = 0;
        // distribute share to affiliate
        _aff = _aff_eth / 10;
        _aff_2 = _aff_eth * 3 / 100;
        _aff_3 = _aff_eth / 100;
        _affID_1 = _affID;// up one member
        _affID_2 = plyr_[_affID_1].laff;// up two member
        _affID_3 = plyr_[_affID_2].laff;// up three member
        // decide what to do with affiliate share of fees
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
            //emit F3Devents.onAffiliatePayout(_affID, plyr_[_affID].addr, plyr_[_affID].name, _rID, _pID, _aff, now);
        } else {
            _p3d = _p3d.add(_aff);
        }
        if (_affID_2 != _pID && _affID_2 != _affID && plyr_[_affID_2].name != '') {
            plyr_[_affID_2].aff = _aff_2.add(plyr_[_affID_2].aff);
        } else {
            _p3d = _p3d.add(_aff_2);
        }
        if (_affID_3 != _pID &&  _affID_3 != _affID && plyr_[_affID_3].name != '') {
            plyr_[_affID_3].aff = _aff_3.add(plyr_[_affID_3].aff);
        } else {
            _p3d = _p3d.add(_aff_3);
        }
        return _p3d;
    }
}