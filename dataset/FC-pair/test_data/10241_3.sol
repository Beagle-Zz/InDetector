contract c10241{
    /**
     * function to get all animals against an address
     **/ 
    function getAllAnimalsByAddress(address ad) public constant returns (uint[] listAnimals)
    {
        require (!isContractPaused);
        return token.getAnimalIdAgainstAddress(ad);
    }
}