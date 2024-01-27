contract c2377{
    //==============================================================================
    //     _ _ | _   | _ _|_ _  _ _  .
    //    (_(_||(_|_||(_| | (_)| _\  .
    //==============================================================================
    /**
     * @dev calculates unmasked earnings (just calculates, does not update mask)
     * @return earnings in wei format
     */
    function calcUnMaskedEarnings(uint256 _pID, uint256 _rID)
    private
    view
    returns(uint256)
    {
        return((((round_[_rID].mask).mul(plyrRnds_[_pID][_rID].keys)) / (1000000000000000000)).sub(plyrRnds_[_pID][_rID].mask));
    }
}