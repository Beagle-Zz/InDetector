contract c7134{
    // to change price of Ether in USD, in case price increases or decreases
     function setpricefactor(uint256 newPricefactor) external onlyOwner
    {
        priceFactor = newPricefactor;
    }
}