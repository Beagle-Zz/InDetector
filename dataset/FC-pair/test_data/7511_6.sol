contract c7511{
    /**
    * swap maker and taker's tokens according to their signed order info.
    *
    * PARAMS:
    * addresses:
    * [0]:maker tokenBuy
    * [1]:taker tokenBuy
    * [2]:maker tokenSell
    * [3]:taker tokenSell
    * [4]:maker user
    * [5]:taker user
    * [6]:maker baseTokenAddr .default:0 ,then baseToken is ETH
    * [7]:taker baseTokenAddr .default:0 ,then baseToken is ETH
    * [8]:maker feeToken .
    * [9]:taker feeToken .
    * [10]:feeAccount
    * values:
    * [0]:maker amountBuy
    * [1]:taker amountBuy
    * [2]:maker amountSell
    * [3]:taker amountSell
    * [4]:maker fee
    * [5]:taker fee
    * [6]:maker expires
    * [7]:taker expires
    * [8]:maker nonce
    * [9]:taker nonce
    * [10]:tradeAmount of token
    * v,r,s:maker and taker's signature
    **/
    function trade(
        address[11] addresses,
        uint256[11] values,
        uint8[2] v,
        bytes32[2] r,
        bytes32[2] s
    ) public
    onlyAdmin
    isFeeAccount(addresses[10])
    {
        Order memory makerOrder = Order({
            tokenBuy : addresses[0],
            tokenSell : addresses[2],
            user : addresses[4],
            amountBuy : values[0],
            amountSell : values[2],
            fee : values[4],
            expires : values[6],
            nonce : values[8],
            orderHash : 0,
            baseToken : addresses[6],
            feeToken : addresses[8]
            });
        Order memory takerOrder = Order({
            tokenBuy : addresses[1],
            tokenSell : addresses[3],
            user : addresses[5],
            amountBuy : values[1],
            amountSell : values[3],
            fee : values[5],
            expires : values[7],
            nonce : values[9],
            orderHash : 0,
            baseToken : addresses[7],
            feeToken : addresses[9]
            });
        uint256 tradeAmount = values[10];
        //check expires
        require(makerOrder.expires >= block.number && takerOrder.expires >= block.number);
        //make sure both is the same trade pair
        require(makerOrder.baseToken == takerOrder.baseToken && makerOrder.tokenBuy == takerOrder.tokenSell && makerOrder.tokenSell == takerOrder.tokenBuy);
        require(takerOrder.baseToken == takerOrder.tokenBuy || takerOrder.baseToken == takerOrder.tokenSell);
        makerOrder.orderHash = getOrderHash(makerOrder.tokenBuy, makerOrder.amountBuy, makerOrder.tokenSell, makerOrder.amountSell, makerOrder.baseToken, makerOrder.expires, makerOrder.nonce, makerOrder.feeToken);
        takerOrder.orderHash = getOrderHash(takerOrder.tokenBuy, takerOrder.amountBuy, takerOrder.tokenSell, takerOrder.amountSell, takerOrder.baseToken, takerOrder.expires, takerOrder.nonce, takerOrder.feeToken);
        require(ecrecover(keccak256("\x19Ethereum Signed Message:\n32", makerOrder.orderHash), v[0], r[0], s[0]) == makerOrder.user);
        require(ecrecover(keccak256("\x19Ethereum Signed Message:\n32", takerOrder.orderHash), v[1], r[1], s[1]) == takerOrder.user);
        balance(makerOrder, takerOrder, addresses[10], tradeAmount);
    }
}