contract c8844{
    /// @notice Have a pregnant LinglongCat give birth!
    /// @param _matronId A LinglongCat ready to give birth.
    /// @return The LinglongCat ID of the new LinglongCat.
    /// @dev Looks at a given LinglongCat and, if pregnant and if the gestation period has passed,
    ///  combines the genes of the two parents to create a new LinglongCat. The new LinglongCat is assigned
    ///  to the current owner of the matron. Upon successful completion, both the matron and the
    ///  new LinglongCat will be ready to breed again. Note that anyone can call this function (if they
    ///  are willing to pay the gas!), but the new LinglongCat always goes to the mother's owner.
    function giveBirth(uint256 _matronId)
        external
        whenNotPaused
        returns(uint256)
    {
        // Grab a reference to the matron in storage.
        LinglongCat storage matron = LinglongCats[_matronId];
        // Check that the matron is a valid cat.
        require(matron.birthTime != 0);
        // Check that the matron is pregnant, and that its time has come!
        require(_isReadyToGiveBirth(matron));
        // Grab a reference to the sire in storage.
        uint256 sireId = matron.siringWithId;
        LinglongCat storage sire = LinglongCats[sireId];
        // Determine the higher generation number of the two parents
        uint16 parentGen = matron.generation;
        if (sire.generation > matron.generation) {
            parentGen = sire.generation;
        }
        // Call the sooper-sekret gene mixing operation.
        uint256 childGenes = geneScience.mixGenes(matron.genes, sire.genes, matron.cooldownEndBlock - 1);
        // Make the new LinglongCat!
        address owner = LinglongCatIndexToOwner[_matronId];
        uint256 LinglongCatId = _createLinglongCat(_matronId, matron.siringWithId, parentGen + 1, childGenes, owner);
        // Clear the reference to sire from the matron (REQUIRED! Having siringWithId
        // set is what marks a matron as being pregnant.)
        delete matron.siringWithId;
        // Every time a LinglongCat gives birth counter is decremented.
        pregnantLinglongCats--;
        // Send the balance fee to the person who made birth happen.
        msg.sender.transfer(autoBirthFee);
        // return the new LinglongCat's ID
        return LinglongCatId;
    }
}