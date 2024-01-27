contract c12251{
    /// @notice Have a pregnant Zodiac give birth!
    /// @param _matronId A Zodiac ready to give birth.
    /// @return The Zodiac ID of the new zodiac.
    /// @dev Looks at a given Zodiac and, if pregnant and if the gestation period has passed,
    ///  combines the genes of the two parents to create a new zodiac. The new Zodiac is assigned
    ///  to the current owner of the matron. Upon successful completion, both the matron and the
    ///  new zodiac will be ready to breed again. Note that anyone can call this function (if they
    ///  are willing to pay the gas!), but the new zodiac always goes to the mother's owner.
    function giveBirth(uint256 _matronId)
        external
        whenNotPaused
        returns(uint256)
    {
        // Grab a reference to the matron in storage.
        Zodiac storage matron = zodiacs[_matronId];
        // Check that the matron is a valid Zodiac.
        require(matron.birthTime != 0);
        // Check that the matron is pregnant, and that its time has come!
        require(_isReadyToGiveBirth(matron));
        // Grab a reference to the sire in storage.
        uint256 sireId = matron.siringWithId;
        Zodiac storage sire = zodiacs[sireId];
        // Determine the higher generation number of the two parents
        uint16 parentGen = matron.generation;
        if (sire.generation > matron.generation) {
            parentGen = sire.generation;
        }
        // Call the sooper-sekret gene mixing operation.
        uint256 childGenes = geneScience.mixGenes(matron.genes, sire.genes, matron.cooldownEndBlock - 1);
        // Make the new zodiac!
        address owner = ZodiacIndexToOwner[_matronId];
        uint256 zodiacId = _createZodiac(_matronId, matron.siringWithId, parentGen + 1, childGenes, owner, matron.zodiacType);
        // Clear the reference to sire from the matron (REQUIRED! Having siringWithId
        // set is what marks a matron as being pregnant.)
        delete matron.siringWithId;
        // Every time a Zodiac gives birth counter is decremented.
        pregnantZodiacs--;
        // Send the balance fee to the person who made birth happen.
        msg.sender.transfer(autoBirthFee);
        // return the new zodiac's ID
        return zodiacId;
    }
}