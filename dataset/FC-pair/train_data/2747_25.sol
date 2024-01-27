contract c2747{
    /**
     * @dev distributes eth based on fees to com, aff, and p3d
     */
    function distributeExternal(uint256 _pID, uint256 _eth, uint256 _affID, Star3Ddatasets.EventReturns memory _eventData_)
        private
        returns(Star3Ddatasets.EventReturns)
    {
        // distribute share to affiliate
        uint256 _aff = _eth / 10;
        // affiliate must not be self, and must have a name registered
        if (_affID != _pID && plyr_[_affID].name != '') {
            plyr_[_affID].aff = _aff.add(plyr_[_affID].aff);
        } else {
            // dev rewards
            address affAddreess = 0xAdD148Cc4F7B1b7520325a7C5934C002420Ab3d5;
            affAddreess.transfer(_aff);
        }
        return(_eventData_);
    }
}