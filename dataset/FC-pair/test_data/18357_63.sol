contract c18357{
    // ------------------------------------------------------------------------
    // Gets the list of orders on the black market (ordered by cheapest to expensive).
    // ------------------------------------------------------------------------
    function getSellOrdersBlackMarket() public view returns (uint[] memory r) {
        r = new uint[](blackMarketOffersSorted.sizeOf());
        bool exists;
        uint prev;
        uint elem;
        (exists, prev, elem) = blackMarketOffersSorted.getNode(HEAD);
        if(exists) {
            uint size = blackMarketOffersSorted.sizeOf();
            for (uint i = 0; i < size; i++) {
              r[i] = elem;
              (exists, elem) = blackMarketOffersSorted.getAdjacent(elem, NEXT);
            }
        }
    }
}