contract c16380{
    /// @dev        assmble order parameters into Order struct.
    /// @return     A list of orders.
    function assembleOrders(
        RingParams params,
        TokenTransferDelegate delegate,
        address[4][]  addressList,
        uint[6][]     uintArgsList,
        uint8[1][]    uint8ArgsList,
        bool[]        buyNoMoreThanAmountBList
        )
        private
        view
        returns (OrderState[] memory orders)
    {
        orders = new OrderState[](params.ringSize);
        for (uint i = 0; i < params.ringSize; i++) {
            uint[6] memory uintArgs = uintArgsList[i];
            bool marginSplitAsFee = (params.feeSelections & (uint16(1) << i)) > 0;
            orders[i] = OrderState(
                addressList[i][0],
                addressList[i][1],
                addressList[(i + 1) % params.ringSize][1],
                addressList[i][2],
                addressList[i][3],
                uintArgs[2],
                uintArgs[3],
                uintArgs[0],
                uintArgs[1],
                uintArgs[4],
                buyNoMoreThanAmountBList[i],
                marginSplitAsFee,
                bytes32(0),
                uint8ArgsList[i][0],
                uintArgs[5],
                uintArgs[1],
                0,   // fillAmountS
                0,   // lrcReward
                0,   // lrcFee
                0,   // splitS
                0    // splitB
            );
            validateOrder(orders[i]);
            bytes32 orderHash = calculateOrderHash(orders[i]);
            orders[i].orderHash = orderHash;
            verifySignature(
                orders[i].owner,
                orderHash,
                params.vList[i],
                params.rList[i],
                params.sList[i]
            );
            params.ringHash ^= orderHash;
        }
        validateOrdersCutoffs(orders, delegate);
        params.ringHash = keccak256(
            params.ringHash,
            params.miner,
            params.feeSelections
        );
    }
}