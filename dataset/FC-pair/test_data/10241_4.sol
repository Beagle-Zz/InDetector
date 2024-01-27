contract c10241{
    /**
     * claim an animal from animal factory
     **/ 
    function claimFreeAnimalFromAnimalFactory( string animalName, string animalDesc) public
    {
        require(msg.sender != 0x0);
        require (!isContractPaused);
        uint gId=0;
        //owner can claim as many free animals as he or she wants
        if (msg.sender!=owner)
        {
            require(token.getTotalTokensAgainstAddress(msg.sender)<freeAnimalsLimit);
            gId=1;
        }
        //sequentially generated animal id   
        uniqueAnimalId++;
        //Generating an Animal Record
        animalObject = AnimalProperties({
            id:uniqueAnimalId,
            name:animalName,
            desc:animalDesc,
            upForSale: false,
            eggPhase: false,
            priceForSale:0,
            upForMating: false,
            priceForMating:0,
            isBornByMating: false,
            parentId1:0,
            parentId2:0,
            birthdate:now,
            costumeId:0, 
            generationId:gId,
			isSpecial:false
        });
        token.sendToken(msg.sender, uniqueAnimalId,animalName);
        //updating the mappings to store animal information  
        animalAgainstId[uniqueAnimalId]=animalObject;
        totalBunniesCreated++;
    }
}