contract c3961{
	// purchasing egg
    function purchaseEgg(uint64 userNumber, uint16 quality) external payable whenNotPaused {
        require(tokensCount >= uniquePetsCount);
        // checking egg availablity
        require(eggAvailable(quality));
        // checking total count of presale eggs
        require(tokensCount <= globalPresaleLimit);
        // calculating price
        uint256 eggPrice = ( recommendedPrice(quality) * (100 - getCurrentDiscountPercent()) ) / 100;
        // checking payment amount
        require(msg.value >= eggPrice);
        // increment egg counter
        purchesedEggs[quality]++;
        // initialize variables for store child genes and quility
        uint256 childGenes;
        uint16 childQuality;
        // get genes and quality of new pet by opening egg through external interface
        (childGenes, childQuality) = geneScience.openEgg(userNumber, quality);
        // creating new pet
        createPet(
            childGenes,      // genes string
            childQuality,    // child quality by open egg
            msg.sender       // owner
        );
    }
}