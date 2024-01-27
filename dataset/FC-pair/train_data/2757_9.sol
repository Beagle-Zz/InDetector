contract c2757{
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
        // setup local rID
        uint256 _rID = rID_;
        // if round has ended.  but round end has not been run (so contract has not distributed winnings)
        if (now > round_[_rID].end && round_[_rID].ended == false)
        {
            uint256 _roundMask;
            uint256 _roundEth;
            uint256 _roundKeys;
            uint256 _roundPot;
            if (round_[_rID].eth == 0 && round_[_rID].ico > 0)
            {
                // create a temp round eth based on eth sent in during ICO phase
                _roundEth = round_[_rID].ico;
                // create a temp round keys based on keys bought during ICO phase
                _roundKeys = (round_[_rID].ico).keys();
                // create a temp round mask based on eth and keys from ICO phase
                _roundMask = ((round_[_rID].icoGen).mul(1000000000000000000)) / _roundKeys;
                // create a temp rount pot based on pot, and dust from mask
                _roundPot = (round_[_rID].pot).add((round_[_rID].icoGen).sub((_roundMask.mul(_roundKeys)) / (1000000000000000000)));
            } else {
                _roundEth = round_[_rID].eth;
                _roundKeys = round_[_rID].keys;
                _roundMask = round_[_rID].mask;
                _roundPot = round_[_rID].pot;
            }
            uint256 _playerKeys;
            if (plyrRnds_[_pID][plyr_[_pID].lrnd].ico == 0)
                _playerKeys = plyrRnds_[_pID][plyr_[_pID].lrnd].keys;
            else
                _playerKeys = calcPlayerICOPhaseKeys(_pID, _rID);
            // if player is winner
            if (round_[_rID].plyr == _pID)
            {
                return
                (
                    (plyr_[_pID].win).add( (_roundPot.mul(48)) / 100 ),
                    (plyr_[_pID].gen).add( getPlayerVaultsHelper(_pID, _roundMask, _roundPot, _roundKeys, _playerKeys) ),
                    plyr_[_pID].aff
                );
            // if player is not the winner
            } else {
                return
                (
                    plyr_[_pID].win,
                    (plyr_[_pID].gen).add( getPlayerVaultsHelper(_pID, _roundMask, _roundPot, _roundKeys, _playerKeys) ),
                    plyr_[_pID].aff
                );
            }
        // if round is still going on, we are in ico phase, or round has ended and round end has been ran
        } else {
            return
            (
                plyr_[_pID].win,
                (plyr_[_pID].gen).add(calcUnMaskedEarnings(_pID, plyr_[_pID].lrnd)),
                plyr_[_pID].aff
            );
        }
    }
}