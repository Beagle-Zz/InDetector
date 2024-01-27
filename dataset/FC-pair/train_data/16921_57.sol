contract c16921{
    /// @dev Internal utility function to start breeding, assumes that all breeding
    ///  requirements have been checked.
    function _breedWith(uint40 _momId, uint40 _dadId) internal returns (uint40)
    {
        // Grab a reference to the Cuties from storage.
        Cutie storage dad = cuties[_dadId];
        Cutie storage mom = cuties[_momId];
        // Trigger the cooldown for both parents.
        _triggerCooldown(_dadId, dad);
        _triggerCooldown(_momId, mom);
        // Clear breeding permission for both parents.
        delete sireAllowedToAddress[_momId];
        delete sireAllowedToAddress[_dadId];
        // Check that the mom is a valid cutie.
        require(mom.birthTime != 0);
        // Determine the higher generation number of the two parents
        uint16 babyGen = config.getBabyGen(mom.generation, dad.generation);
        // Call the gene mixing operation.
        uint256 childGenes = geneMixer.mixGenes(mom.genes, dad.genes);
        // Make the new cutie
        address owner = cutieIndexToOwner[_momId];
        uint40 cutieId = _createCutie(_momId, _dadId, babyGen, getCooldownIndexFromGeneration(babyGen), childGenes, owner, mom.cooldownEndTime);
        // return the new cutie's ID
        return cutieId;
    }
}