contract c13447{
    /**
     * Return the sell price of 1 individual token.
     */
    function buyPrice() 
        public 
        view 
        returns(uint256)
     {
            return tokenPrice;
        }
}