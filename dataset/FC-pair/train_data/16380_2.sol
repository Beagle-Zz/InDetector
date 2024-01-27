contract c16380{
    /// @dev Validate a ring.
    function verifyRingHasNoSubRing(
        uint          ringSize,
        OrderState[]  orders
        )
        private
        pure
    {
        // Check the ring has no sub-ring.
        for (uint i = 0; i < ringSize - 1; i++) {
            address tokenS = orders[i].tokenS;
            for (uint j = i + 1; j < ringSize; j++) {
                require(tokenS != orders[j].tokenS); // "found sub-ring");
            }
        }
    }
}