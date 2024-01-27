contract c10241{
    /**
     * function to accept a mate offer by offering one of your own animals 
     * and paying ethers ofcourse
     **/ 
    function mateAnimal(uint parent1Id, uint parent2Id, string animalName,string animalDesc) public payable 
    {
        require (!isContractPaused);
        require(msg.sender != 0x0);
        //the requester is actually the owner of the animal which he or she is offering for mating
        require (token.ownerOf(parent2Id) == msg.sender);
        //a user cannot mate two of his own animals
        require(token.ownerOf(parent2Id)!=token.ownerOf(parent1Id));
        //the animal id given was actually advertised for mating
        require(animalAgainstId[parent1Id].upForMating==true);
		require(animalAgainstId[parent1Id].isSpecial==false);
		require(animalAgainstId[parent2Id].isSpecial==false);
        // the price requested for mating
        uint price=animalAgainstId[parent1Id].priceForMating;
        // the owner fees 
        uint OwnerPercentage=animalAgainstId[parent1Id].priceForMating.mul(ownerPerThousandShareForMating);
        OwnerPercentage=OwnerPercentage.div(1000);
        uint priceWithOwnerPercentage = animalAgainstId[parent1Id].priceForMating.add(OwnerPercentage);
        // the ethers sent should be enough to cover the mating price and the owner fees
        require(msg.value>=priceWithOwnerPercentage);
        uint generationnum = 1;
        if(animalAgainstId[parent1Id].generationId >= animalAgainstId[parent2Id].generationId)
        {
        generationnum = animalAgainstId[parent1Id].generationId+1;
        }
        else{
        generationnum = animalAgainstId[parent2Id].generationId+1;
        }
        // sequentially generated id for animal
         uniqueAnimalId++;
        //Adding Saving Animal Record
        animalObject = AnimalProperties({
            id:uniqueAnimalId,
            name:animalName,
            desc:animalDesc,
            upForSale: false,
            priceForSale:0,
            upForMating: false,
            eggPhase: true,     
            priceForMating:0,
            isBornByMating:true,
            parentId1: parent1Id,
            parentId2: parent2Id,
            birthdate:now,
            costumeId:0,
            generationId:generationnum,
			isSpecial:false
          });
        // transfer token only
        token.sendToken(msg.sender,uniqueAnimalId,animalName);
        //updating the mappings to store animal information
        animalAgainstId[uniqueAnimalId]=animalObject;
        //adding the generated animal to egg phase list
        eggPhaseAnimalIds.push(uniqueAnimalId);
        //adding this animal as a child to the parents who mated to produce this offspring
        childrenIdAgainstAnimalId[parent1Id].push(uniqueAnimalId);
        childrenIdAgainstAnimalId[parent2Id].push(uniqueAnimalId);
        //remove from for mate list
        for (uint i=0;i<upForMatingList.length;i++)
        {
            if (upForMatingList[i]==parent1Id)
                delete upForMatingList[i];   
        }
        //remove the parent animal from mating advertisment      
        animalAgainstId[parent1Id].upForMating = false;
        animalAgainstId[parent1Id].priceForMating = 0;
        //transfer of money from beneficiary to mate owner
        token.ownerOf(parent1Id).transfer(price);
        //transfer of percentage money to ownerWallet
        owner.transfer(OwnerPercentage);
        // return extra funds if sent by mistake
        if(msg.value>priceWithOwnerPercentage)
        {
            msg.sender.transfer(msg.value.sub(priceWithOwnerPercentage));
        }
    }
}