contract c10241{
    /**
     * function to set the new price 
     * can only be called from owner wallet
     **/ 
    function setPriceRate(uint256 newPrice) public onlyOwner returns (bool) 
    {
        weiPerAnimal = newPrice;
    }
}