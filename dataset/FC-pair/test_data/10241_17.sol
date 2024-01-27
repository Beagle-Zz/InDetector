contract c10241{
     /**
     * function to set the sale advertisement price
     * can only be called from owner wallet
     **/ 
    function setSaleAdvertisementRate(uint256 newPrice) public onlyOwner returns (bool) 
    {
        priceForSaleAdvertisement = newPrice;
    }
}