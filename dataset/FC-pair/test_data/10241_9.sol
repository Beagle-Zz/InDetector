contract c10241{
    /**
     * Advertise your animal for selling in exchange for ethers
     **/ 
    function putSaleRequest(uint animalId, uint salePrice) public payable
    {
        require (!isContractPaused);
        //everyone except owner has to pay the adertisement fees
        if (msg.sender!=owner)
        {
            require(msg.value>=priceForSaleAdvertisement);  
        }
        //the advertiser is actually the owner of the animal id provided
        require(token.ownerOf(animalId)==msg.sender);
        //you cannot advertise an animal for sale which is in egg phase
        require(animalAgainstId[animalId].eggPhase==false);
        // you cannot advertise an animal for sale which is already on sale
        require(animalAgainstId[animalId].upForSale==false);
        //you cannot put an animal for sale and mate simultaneously
        require(animalAgainstId[animalId].upForMating==false);
        //putting up the flag for sale 
        animalAgainstId[animalId].upForSale=true;
        animalAgainstId[animalId].priceForSale=salePrice;
        upForSaleList.push(animalId);
        //transferring the sale advertisement price to the owner
        owner.transfer(msg.value);
    }
}