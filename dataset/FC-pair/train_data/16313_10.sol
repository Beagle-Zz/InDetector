contract c16313{
    /// @dev verify input data's basic integrity.
    function verifyInputDataIntegrity(
        RingParams params,
        address[4][]  addressList,
        uint[6][]     uintArgsList,
        uint8[1][]    uint8ArgsList,
        bool[]        buyNoMoreThanAmountBList
        )
        private
        pure
    {
        require(params.feeRecipient != 0x0);
        require(params.ringSize == addressList.length);
        require(params.ringSize == uintArgsList.length);
        require(params.ringSize == uint8ArgsList.length);
        require(params.ringSize == buyNoMoreThanAmountBList.length);
        // Validate ring-mining related arguments.
        for (uint i = 0; i < params.ringSize; i++) {
            require(uintArgsList[i][5] > 0); // "order rateAmountS is zero");
        }
        //Check ring size
        require(params.ringSize > 1 && params.ringSize <= MAX_RING_SIZE); // "invalid ring size");
        uint sigSize = params.ringSize << 1;
        require(sigSize == params.vList.length);
        require(sigSize == params.rList.length);
        require(sigSize == params.sList.length);
    }
}