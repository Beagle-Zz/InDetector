contract c2746{
    /**
     * @dev takes keys bought during ICO phase, and adds them to round.  pays 
     * out gen rewards that accumulated during ICO phase 
     */
    function roundClaimICOKeys(uint256 _rID)
        private
    {
        // update round eth to account for ICO phase eth investment 
        round_[_rID].eth = round_[_rID].ico;
        // add keys to round that were bought during ICO phase
        round_[_rID].keys = (round_[_rID].ico).keys();
        // store average ICO key price 
        round_[_rID].icoAvg = calcAverageICOPhaseKeyPrice(_rID);
        // set round mask from ICO phase
        uint256 _ppt = ((round_[_rID].icoGen).mul(1000000000000000000)) / (round_[_rID].keys);
        uint256 _dust = (round_[_rID].icoGen).sub((_ppt.mul(round_[_rID].keys)) / (1000000000000000000));
        if (_dust > 0)
            round_[_rID].pot = (_dust).add(round_[_rID].pot);   // <<< your adding to pot and havent updated event data
        // distribute gen portion to key holders
        round_[_rID].mask = _ppt.add(round_[_rID].mask);
    }
}