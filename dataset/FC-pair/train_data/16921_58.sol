contract c16921{
    /// @dev Completes a breeding tutorial cutie (non existing in blockchain)
    ///  with auction by bidding. Immediately breeds with dad on auction.
    /// @param _dadId - ID of the dad on auction.
    function bidOnBreedingAuctionTutorial(
        uint40 _dadId
    )
        public
        payable
        whenNotPaused
        returns (uint)
    {
        require(isTutorialPetUsed[msg.sender] == 0);
        // Take breeding fee
        uint256 fee = getBreedingFee(0, _dadId);
        require(msg.value >= fee);
        // breeding auction will throw if the bid fails.
        breedingMarket.bid.value(msg.value - fee)(_dadId);
        // Grab a reference to the Cuties from storage.
        Cutie storage dad = cuties[_dadId];
        // Trigger the cooldown for parent.
        _triggerCooldown(_dadId, dad);
        // Clear breeding permission for parent.
        delete sireAllowedToAddress[_dadId];
        uint16 babyGen = config.getTutorialBabyGen(dad.generation);
        // tutorial pet genome is zero
        uint256 childGenes = geneMixer.mixGenes(0x0, dad.genes);
        // tutorial pet id is zero
        uint40 cutieId = _createCutie(0, _dadId, babyGen, getCooldownIndexFromGeneration(babyGen), childGenes, msg.sender, 12);
        isTutorialPetUsed[msg.sender] = cutieId;
        // return the new cutie's ID
        return cutieId;
    }
}