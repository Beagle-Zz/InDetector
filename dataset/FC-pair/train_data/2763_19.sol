contract c2763{
    /**
     * @dev at end of ICO phase, each player is entitled to X keys based on final
     * average ICO phase key price, and the amount of eth they put in during ICO.
     * if a player participates in the round post ICO, these will be "claimed" and
     * added to their rounds total keys.  if not, this will be used to calculate
     * their gen earnings throughout round and on round end.
     * -functionhash- 0x75661f4c
     * @return players keys bought during ICO phase
     */
    function calcPlayerICOPhaseKeys(uint256 _pID, uint256 _rID)
        public
        view
        returns(uint256)
    {
        if (round_[_rID].icoAvg != 0 || round_[_rID].ico == 0 )
            return(  ((plyrRnds_[_pID][_rID].ico).mul(1000000000000000000)) / round_[_rID].icoAvg  );
        else
            return(  ((plyrRnds_[_pID][_rID].ico).mul(1000000000000000000)) / calcAverageICOPhaseKeyPrice(_rID)  );
    }
}