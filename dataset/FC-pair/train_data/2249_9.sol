contract c2249{
    /**
     * @dev returns player earnings per vaults 
     * -functionhash- 0x63066434
     * @return winnings vault
     * @return general vault
     * @return affiliate vault
     */
    function getPlayerVaults(uint256 _pID)
        public
        view
        returns(uint256 ,uint256, uint256)
    {
        // if round has ended.  but round end has not been run (so contract has not distributed winnings)
        if (now > round_.end && round_.ended == false && round_.plyr != 0)
        {
            // if player is winner 
            if (round_.plyr == _pID)
            {
                return
                (
                    (plyr_[_pID].win).add( ((round_.pot).mul(48)) / 100 ),
                    (plyr_[_pID].gen).add(  getPlayerVaultsHelper(_pID).sub(plyrRnds_[_pID].mask)   ),
                    plyr_[_pID].aff
                );
            // if player is not the winner
            } else {
                return
                (
                    plyr_[_pID].win,
                    (plyr_[_pID].gen).add(  getPlayerVaultsHelper(_pID).sub(plyrRnds_[_pID].mask)  ),
                    plyr_[_pID].aff
                );
            }
        // if round is still going on, or round has ended and round end has been ran
        } else {
            return
            (
                plyr_[_pID].win,
                (plyr_[_pID].gen).add(calcUnMaskedEarnings(_pID)),
                plyr_[_pID].aff
            );
        }
    }
}