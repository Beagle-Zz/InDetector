contract c10241{
    /**
     * Function to buy animals from the factory in exchange for ethers
     **/ 
    function buyAnimalsFromAnimalFactory(string animalName, string animalDesc) public payable 
    {
        require (!isContractPaused);
        require(validPurchase());
        require(msg.sender != 0x0);
        uint gId=0;
        //owner can claim as many free animals as he or she wants
        if (msg.sender!=owner)
        {
            gId=1;
        }
        uint256 weiAmount = msg.value;
        // calculate token amount to be created
        uint256 tokens = weiAmount.div(weiPerAnimal);
        // update state
        weiRaised = weiRaised.add(weiAmount);
        uniqueAnimalId++;
        //Generating Animal Record
        animalObject = AnimalProperties({
            id:uniqueAnimalId,
            name:animalName,
            desc:animalDesc,
            upForSale: false,
            priceForSale:0,
            upForMating: false,
            eggPhase: false,
            priceForMating:0,
            isBornByMating:false,
            parentId1:0,
            parentId2:0,
            birthdate:now,
            costumeId:0,
            generationId:gId,
			isSpecial:false
        });
        //transferring the token
        token.sendToken(msg.sender, uniqueAnimalId,animalName); 
        emit AnimalsPurchased(msg.sender, owner, weiAmount, tokens);
        //updating the mappings to store animal records
        animalAgainstId[uniqueAnimalId]=animalObject;
        totalBunniesCreated++;
        //transferring the ethers to the owner of the contract
        owner.transfer(msg.value);
    }
}