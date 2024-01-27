contract c10241{
    /** 
     * Buying animals from a user 
     **/ 
    function buyAnimalsFromUser(uint animalId) public payable 
    {
        require (!isContractPaused);
        require(msg.sender != 0x0);
        address prevOwner=token.ownerOf(animalId);
        //checking that a user is not trying to buy an animal from himself
        require(prevOwner!=msg.sender);
        //the price of sale
        uint price=animalAgainstId[animalId].priceForSale;
        //the percentage of owner         
        uint OwnerPercentage=animalAgainstId[animalId].priceForSale.mul(ownerPerThousandShareForBuying);
        OwnerPercentage=OwnerPercentage.div(1000);
        uint priceWithOwnerPercentage = animalAgainstId[animalId].priceForSale.add(OwnerPercentage);
        //funds sent should be enough to cover the selling price plus the owner fees
        require(msg.value>=priceWithOwnerPercentage); 
        // transfer token only
       // token.mint(prevOwner,msg.sender,1); 
    // transfer token here
        token.safeTransferFrom(prevOwner,msg.sender,animalId);
        // change mapping in animalAgainstId
        animalAgainstId[animalId].upForSale=false;
        animalAgainstId[animalId].priceForSale=0;
        //remove from for sale list
        for (uint j=0;j<upForSaleList.length;j++)
        {
          if (upForSaleList[j] == animalId)
            delete upForSaleList[j];
        }      
        //transfer of money from buyer to beneficiary
        prevOwner.transfer(price);
        //transfer of percentage money to ownerWallet
        owner.transfer(OwnerPercentage);
        // return extra funds if sent by mistake
        if(msg.value>priceWithOwnerPercentage)
        {
            msg.sender.transfer(msg.value.sub(priceWithOwnerPercentage));
        }
    }
}