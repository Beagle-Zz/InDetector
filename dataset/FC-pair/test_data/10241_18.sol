contract c10241{
     /**
     * function to set the sale advertisement price
     * can only be called from owner wallet
     **/ 
    function setBuyingCostumeRate(uint256 newPrice) public onlyOwner returns (bool) 
    {
        priceForBuyingCostume = newPrice;
    }
}