contract c2285{
    /**
    *@dev Gets number of open orderbooks
    *@return _uint of the number of tokens with open orders
    */
    function getBookCount() public constant returns(uint) {
        return openBooks.length;
    }
}