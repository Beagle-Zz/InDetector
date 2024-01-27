contract c10241{
     /**
     * function to get all sale animals ids
     **/ 
    function getAllSaleAnimals() public constant returns (uint[]) 
    {
        return upForSaleList;
    }
}