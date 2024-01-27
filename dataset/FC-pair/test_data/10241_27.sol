contract c10241{
    /**
     * function to get all animals in the egg phase list
     **/  
    function getEggPhaseList() public constant returns (uint[]) 
    {
        return eggPhaseAnimalIds;
    }
}