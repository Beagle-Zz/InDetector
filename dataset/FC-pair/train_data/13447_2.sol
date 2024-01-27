contract c13447{
    /**
     * Return the buy price of 1 individual token.
     */
    function sellPrice() 
        public 
        view 
        returns(uint256)
        {
            return tokenPrice;
        }
}