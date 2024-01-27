contract c16772{
    /// @dev we can create promo kittens, up to a limit. Only callable by COO
    /// @param _genes the encoded genes of the kitten to be created, any value is accepted
    /// @param _owner the future owner of the created kittens. Default to contract COO
    function createPromoPet(uint256 _genes, address _owner, uint256 _grade, uint256 _level, uint256 _params, uint256 _skills) external onlyCOO {
        address petOwner = _owner;
        if (petOwner == address(0)) {
            petOwner = cooAddress;
        }
        require(promoCreatedCount < PROMO_CREATION_LIMIT);
        promoCreatedCount++;
        _createPet(0, _genes, petOwner, _grade, _level, _params, _skills);
    }
}