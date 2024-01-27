contract c10241{
       /**
     * function to request to buy costume
     **/  
    function buyCostume(uint cId, uint aId) public payable 
    {
        require(msg.value>=priceForBuyingCostume);
        require(!isContractPaused);
        require(token.ownerOf(aId)==msg.sender);
        require(animalAgainstId[aId].costumeId==0);
        animalAgainstId[aId].costumeId=cId;
        animalIdsWithPendingCostumes.push(aId);
        // transfer the mating advertisement charges to owner
        owner.transfer(msg.value);
    }
}