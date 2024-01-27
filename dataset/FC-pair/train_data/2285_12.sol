contract c2285{
    /**
    *@dev getOrders allows parties to get an array of all orderId's open for a given token
    *@param _token address of the drct token
    *@return _uint[] an array of the orders in the orderbook
    */
    function getOrders(address _token) public constant returns(uint[]) {
        return forSale[_token];
    }
}