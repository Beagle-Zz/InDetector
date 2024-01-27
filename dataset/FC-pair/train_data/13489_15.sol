contract c13489{
   /** 
     *  @dev view current price of tokens
     */
    function viewCurrentPrice() view returns (uint) {
        if(tokensSold <= 1000){
            return basePrice + step1 * tokensSold;
        }
        if(tokensSold > 1000 && tokensSold <= 3000){
            return basePrice + (step1 * 1000) + (step2 * (tokensSold-1000));
        }
        if(tokensSold > 3000){
            return basePrice + (step1 * 1000) + (step2 * 2000) + (step3 * (tokensSold-3000));
        }
    }
}