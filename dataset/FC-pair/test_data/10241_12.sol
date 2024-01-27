contract c10241{
    /**
     * withdraw the mating request that was put earlier
     **/ 
    function withdrawMatingRequest(uint animalId) public
    {
        require(!isContractPaused);
        require(token.ownerOf(animalId)==msg.sender);
        require(animalAgainstId[animalId].upForMating==true);
        animalAgainstId[animalId].upForMating=false;
        animalAgainstId[animalId].priceForMating=0;
        for (uint i=0;i<upForMatingList.length;i++)
        {
            if (upForMatingList[i]==animalId)
                delete upForMatingList[i];    
        }
    }
}