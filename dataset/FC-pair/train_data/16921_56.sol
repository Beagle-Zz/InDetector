contract c16921{
    /// @notice Breed cuties that you own, or for which you
    ///  have previously been given Breeding approval. Will either make your cutie give birth, or will
    ///  fail.
    /// @param _momId The ID of the Cutie acting as mom (will end up give birth if successful)
    /// @param _dadId The ID of the Cutie acting as dad (will begin its breeding cooldown if successful)
    function breedWith(uint40 _momId, uint40 _dadId) 
        public
        whenNotPaused
        payable
        returns (uint40)
    {
        // Caller must own the mom.
        require(_isOwner(msg.sender, _momId));
        // Neither dad nor mom can be on auction during
        // breeding.
        // For mom: The caller of this function can't be the owner of the mom
        //   because the owner of a Cutie on auction is the auction house, and the
        //   auction house will never call breedWith().
        // For dad: Similarly, a dad on auction will be owned by the auction house
        //   and the act of transferring ownership will have cleared any outstanding
        //   breeding approval.
        // Thus we don't need check if either cutie
        // is on auction.
        // Check that mom and dad are both owned by caller, or that the dad
        // has given breeding permission to caller (i.e. mom's owner).
        // Will fail for _dadId = 0
        require(_isBreedingPermitted(_dadId, _momId));
        // Check breeding fee
        require(getBreedingFee(_momId, _dadId) <= msg.value);
        // Grab a reference to the potential mom
        Cutie storage mom = cuties[_momId];
        // Make sure mom's cooldown isn't active, or in the middle of a breeding cooldown
        require(_canBreed(mom));
        // Grab a reference to the potential dad
        Cutie storage dad = cuties[_dadId];
        // Make sure dad cooldown isn't active, or in the middle of a breeding cooldown
        require(_canBreed(dad));
        // Test that these cuties are a valid mating pair.
        require(_canPairMate(
            mom,
            _momId,
            dad,
            _dadId
        ));
        return _breedWith(_momId, _dadId);
    }
}