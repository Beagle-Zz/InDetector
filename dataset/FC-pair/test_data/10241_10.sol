contract c10241{
    /**
     * function to withdraw a sale advertisement that was put earlier
     **/ 
    function withdrawSaleRequest(uint animalId) public
    {
        require (!isContractPaused);
        // the animal id actually belongs to the requester
        require(token.ownerOf(animalId)==msg.sender);
        // the animal in question is still up for sale
        require(animalAgainstId[animalId].upForSale==true);
        // change the animal state to not be on sale
        animalAgainstId[animalId].upForSale=false;
        animalAgainstId[animalId].priceForSale=0;
        // remove the animal from sale list
        for (uint i=0;i<upForSaleList.length;i++)
        {
            if (upForSaleList[i]==animalId)
                delete upForSaleList[i];     
        }
    }
}