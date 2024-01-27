contract c16921{
    /// @notice Checks that a certain cutie is not
    ///  in the middle of a breeding cooldown and is able to breed.
    /// @param _cutieId reference the id of the cutie, any user can inquire about it
    function canBreed(uint40 _cutieId)
        public
        view
        returns (bool)
    {
        require(_cutieId > 0);
        Cutie storage cutie = cuties[_cutieId];
        return _canBreed(cutie);
    }
}