contract c13772{
    /// @notice Checks that a given EtherDog is able to breed (i.e. it is not pregnant or
    ///  in the middle of a siring cooldown).
    /// @param _EtherDogId reference the id of the EtherDog, any user can inquire about it
    function isReadyToBreed(uint256 _EtherDogId)
        public
        view
        returns (bool)
    {
        require(_EtherDogId > 0);
        EtherDog storage kit = EtherDogs[_EtherDogId];
        return _isReadyToBreed(kit);
    }
}