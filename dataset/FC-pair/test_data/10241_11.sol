contract c10241{
    /**
     * function to put mating request in exchange for ethers
     **/ 
    function putMatingRequest(uint animalId, uint matePrice) public payable
    {
        require(!isContractPaused);
		require(animalAgainstId[animalId].isSpecial==false);
        // the owner of the contract does not need to pay the mate advertisement fees
        if (msg.sender!=owner)
        {
            require(msg.value>=priceForMateAdvertisement);
        }
        require(token.ownerOf(animalId)==msg.sender);
        // an animal in egg phase cannot be put for mating
        require(animalAgainstId[animalId].eggPhase==false);
        // an animal on sale cannot be put for mating
        require(animalAgainstId[animalId].upForSale==false);
        // an animal already up for mating cannot be put for mating again
        require(animalAgainstId[animalId].upForMating==false);
        animalAgainstId[animalId].upForMating=true;
        animalAgainstId[animalId].priceForMating=matePrice;
        upForMatingList.push(animalId);
        // transfer the mating advertisement charges to owner
        owner.transfer(msg.value);
    }
}