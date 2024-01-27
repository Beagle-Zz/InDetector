contract c3125{
   /**
     * Retrieve the jackpot amount.
     */
    function jackpot()
        public
        view
        returns(uint256)
    {
        return jackpot_;
    }
}