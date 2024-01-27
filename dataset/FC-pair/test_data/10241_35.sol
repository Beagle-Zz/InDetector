contract c10241{
	    /**
     * function to update an animal
     * can only be called from owner wallet
     **/  
    function updateAnimalSpecial(uint animalId, bool isSpecial) public onlyOwner 
    { 
        require(msg.sender==token.ownerOf(animalId));
        animalAgainstId[animalId].isSpecial=isSpecial;
    }
}