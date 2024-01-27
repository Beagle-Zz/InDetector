contract c10241{
    /**
     * function to get animal details by id
     **/ 
    function getAnimalById(uint aid) public constant returns 
    (string, string,uint,uint ,uint, uint,uint)
    {
        if(animalAgainstId[aid].eggPhase==true)
        {
            return(animalAgainstId[aid].name,
            animalAgainstId[aid].desc,
            2**256 - 1,
            animalAgainstId[aid].priceForSale,
            animalAgainstId[aid].priceForMating,
            animalAgainstId[aid].parentId1,
            animalAgainstId[aid].parentId2
            );
        }
        else 
        {
            return(animalAgainstId[aid].name,
            animalAgainstId[aid].desc,
            animalAgainstId[aid].id,
            animalAgainstId[aid].priceForSale,
            animalAgainstId[aid].priceForMating,
            animalAgainstId[aid].parentId1,
            animalAgainstId[aid].parentId2
            );
        }
    }
}