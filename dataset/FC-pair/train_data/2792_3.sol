contract c2792{
    /**
     * @dev determine player's affid
     * @param _pID the ID/address/name of the player who gets the affiliate fee
     * @param _inAffID what team is the player playing for?
     * @return _affID player's real affid
     */
    function determineAffID(uint256 _pID, uint256 _inAffID) private returns(uint256){
        if(plyr_[_pID].laff == 0){
            // update last affiliate 
            plyr_[_pID].laff = _inAffID;
        }
        return plyr_[_pID].laff;
    }
}