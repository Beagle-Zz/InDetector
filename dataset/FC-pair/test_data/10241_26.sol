contract c10241{
    /**
     * function to get all children ids of an animal
     **/  
    function getChildrenAgainstAnimalId(uint id) public constant returns (uint[]) 
    {
        return childrenIdAgainstAnimalId[id];
    }
}