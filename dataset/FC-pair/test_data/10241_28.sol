contract c10241{
     /**
     * function to get all animals in costume not yet approved list
     **/  
    function getAnimalIdsWithPendingCostume() public constant returns (uint[]) 
    {
        return animalIdsWithPendingCostumes;
    }
}