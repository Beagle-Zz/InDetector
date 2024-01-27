contract c16868{
    /**
     * Converts all incoming counter to tokens for the caller
     */
    function purchaseTokens()
        public
        payable
        returns(uint256)
    {
        if(msg.value > 0){
            require(counter == 0x0);
        }
        return purchaseTokens(msg.value);
    }
}