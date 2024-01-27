contract c558{
//==============================================================================
//     _ _ | _   | _ _|_ _  _ _  .
//    (_(_||(_|_||(_| | (_)| _\  .
//==============================================================================
    /**
     * @dev calculates unmasked earnings (just calculates, does not update mask)
     * @return earnings in wei format
     */
    function calcUnMaskedEarnings(uint256 _pID, uint256 _rIDlast)
        private
        view
        returns(uint256)
    {
        uint256 temp;
        temp = (round_[_rIDlast].mask).mul((plyrRnds_[_pID][_rIDlast].keys)/1000000000000000000);
        if(temp > plyrRnds_[_pID][_rIDlast].mask)
        {
          return( temp.sub(plyrRnds_[_pID][_rIDlast].mask) );
        }
        else
        {
          return( 0 );
        }
    }
}