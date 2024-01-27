contract c10241{
    /**
     * function to update an animal
     * can only be called from owner wallet
     **/  
    function updateAnimal(uint animalId, string name, string desc) public  
    { 
        require(msg.sender==token.ownerOf(animalId));
        animalAgainstId[animalId].name=name;
        animalAgainstId[animalId].desc=desc;
        token.setAnimalMeta(animalId, name);
    }
}