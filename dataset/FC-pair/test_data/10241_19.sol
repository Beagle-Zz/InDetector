contract c10241{
     /**
     * function to get all mating animal ids
     **/ 
    function getAllMatingAnimals() public constant returns (uint[]) 
    {
        return upForMatingList;
    }
}