contract c13952{
    /*****************************************************/
    /********** PUBLIC PURE FUNCTIONS ********************/
    /*****************************************************/
    // Gets a new 5-card hand, stored in uint32
    // Gas Cost: 3k
    function getHand(uint256 _hash)
        public
        pure
        returns (uint32)
    {
        // Return the cards as a hand.
        return uint32(getCardsFromHash(_hash, 5, 0));
    }
}