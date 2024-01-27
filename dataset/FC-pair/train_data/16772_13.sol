contract c16772{
        /// @dev An internal method that creates a new kitty and stores it. This
    ///  method doesn't do any checking and should only be called when the
    ///  input data is known to be valid. Will generate both a Birth event
    ///  and a Transfer event.
    /// @param _generation The generation number of this cat, must be computed by caller.
    /// @param _genes The kitty's genetic code.
    /// @param _owner The inital owner of this cat, must be non-zero (except for the unKitty, ID 0)
    function _createPet(
        uint256 _generation,
        uint256 _genes,
        address _owner,
        uint256 _grade,
        uint256 _level,
        uint256 _params,
        uint256 _skills
    )
        internal
        returns (uint)
    {
        // These requires are not strictly necessary, our calling code should make
        // sure that these conditions are never broken. However! _createKitty() is already
        // an expensive call (for storage), and it doesn't hurt to be especially careful
        // to ensure our data structures are always valid.
        require(_generation == uint256(uint16(_generation)));
        // New pet starts with the same cooldown as parent gen/2
        uint16 cooldownIndex = uint16(_generation / 2);
        if (cooldownIndex > 13) {
            cooldownIndex = 13;
        }
        Pet memory _pet = Pet({
            genes: _genes,
            birthTime: uint64(now),            
            generation: uint16(_generation),
            grade: uint16(_grade), 
            level: uint16(_level), 
            params: uint16(_params),            
            skills: uint16(_skills)
        });
        uint256 newPetId = pets.push(_pet) - 1;
        // It's probably never going to happen, 4 billion cats is A LOT, but
        // let's just be 100% sure we never let this happen.
        require(newPetId == uint256(uint32(newPetId)));
        // emit the birth event
        emit Birth(
            _owner,
            newPetId,
            _pet.genes
        );
        // This will assign ownership, and also emit the Transfer event as
        // per ERC721 draft
        _transfer(0, _owner, newPetId);
        return newPetId;
    }
}