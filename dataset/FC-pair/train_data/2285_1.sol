contract c2285{
    /**
    *@dev list allows a party to place an order on the orderbook
    *@param _tokenadd address of the drct tokens
    *@param _amount number of DRCT tokens
    *@param _price uint256 price of all tokens in wei
    */
    function list(address _tokenadd, uint256 _amount, uint256 _price) external {
        require(blacklist[msg.sender] == false);
        require(_price > 0);
        ERC20_Interface token = ERC20_Interface(_tokenadd);
        require(token.allowance(msg.sender,address(this)) >= _amount);
        if(forSale[_tokenadd].length == 0){
            forSale[_tokenadd].push(0);
            }
        forSaleIndex[order_nonce] = forSale[_tokenadd].length;
        forSale[_tokenadd].push(order_nonce);
        orders[order_nonce] = Order({
            maker: msg.sender,
            asset: _tokenadd,
            price: _price,
            amount:_amount
        });
        emit OrderPlaced(msg.sender,_tokenadd,_amount,_price);
        if(openBookIndex[_tokenadd] == 0 ){    
            openBookIndex[_tokenadd] = openBooks.length;
            openBooks.push(_tokenadd);
        }
        userOrderIndex[order_nonce] = userOrders[msg.sender].length;
        userOrders[msg.sender].push(order_nonce);
        order_nonce += 1;
    }
}