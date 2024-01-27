contract c2285{
    /**
    *@dev getOrderCount allows parties to query how many orders are on the book
    *@param _token address used to count the number of orders
    *@return _uint of the number of orders in the orderbook
    */
    function getOrderCount(address _token) public constant returns(uint) {
        return forSale[_token].length;
    }
}