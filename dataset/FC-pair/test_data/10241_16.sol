contract c10241{
     /**
     * function to set the mate advertisement price 
     * can only be called from owner wallet
     **/ 
    function setMateAdvertisementRate(uint256 newPrice) public onlyOwner returns (bool) 
    {
        priceForMateAdvertisement = newPrice;
    }
}