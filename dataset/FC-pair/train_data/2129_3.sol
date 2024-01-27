contract c2129{
    /**
     * @dev determine player's affid
     * @param _pID player's id
     * @param _inAffID inviter's pid
     * @return _affID player's real affid
     */
    function determineAffID(uint256 _pID, uint256 _inAffID) private returns(uint256){
        // affiliate must not be self, and must have a name registered
        if(plyr_[_pID].laff == 0 && 0 != _inAffID && _pID != _inAffID && plyr_[_inAffID].name != ''){
            // update last affiliate 
            plyr_[_pID].laff = _inAffID;
            // _inAffID invite a new player, count it.
            // update invite num of inviter for this round. if in round 0, add to round 1
            uint256 _rID = (0 == rID_)?1:rID_;
            plyrRnds_[_rID][_inAffID].affNum =  plyrRnds_[_rID][_inAffID].affNum.add(1);
            //update max invite num pid of this round
            if( plyrRnds_[_rID][round_[_rID].maxAffPID].affNum < plyrRnds_[_rID][_inAffID].affNum){
                round_[_rID].maxAffPID = _inAffID;
            }
        }
        return plyr_[_pID].laff;
    }
}