contract c2764{
    /**
     * @dev average ico phase key price is total eth put in, during ICO phase,
     * divided by the number of keys that were bought with that eth.
     * -functionhash- 0xdcb6af48
     * @return average key price
     */
    function calcAverageICOPhaseKeyPrice(uint256 _rID)
        public
        view
        returns(uint256)
    {
        return(  (round_[_rID].ico).mul(1000000000000000000) / (round_[_rID].ico).keys()  );
    }
}