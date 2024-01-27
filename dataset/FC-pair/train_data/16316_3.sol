contract c16316{
    /// @dev Verify the ringHash has been signed with each order's auth private
    ///      keys as well as the miner's private key.
    function verifyRingSignatures(
        RingParams params,
        OrderState[] orders
        )
        private
        pure
    {
        uint j;
        for (uint i = 0; i < params.ringSize; i++) {
            j = i + params.ringSize;
            verifySignature(
                orders[i].authAddr,
                params.ringHash,
                params.vList[j],
                params.rList[j],
                params.sList[j]
            );
        }
    }
}