contract c10241{
    /**
     * function to transfer an animal to another user
     * direct token cannot be passed as we have disabled the transfer feature
     * all animal transfers should occur through this function
     **/ 
    function TransferAnimalToAnotherUser(uint animalId,address to) public 
    {
        require (!isContractPaused);
        require(msg.sender != 0x0);
        //the requester of the transfer is actually the owner of the animal id provided
        require(token.ownerOf(animalId)==msg.sender);
        //if an animal has to be transferred, it shouldnt be up for sale or mate
        require(animalAgainstId[animalId].upForSale == false);
        require(animalAgainstId[animalId].upForMating == false);
        token.safeTransferFrom(msg.sender, to, animalId);
        }
}