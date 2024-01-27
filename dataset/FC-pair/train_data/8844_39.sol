contract c8844{
    /// @notice Checks that a given LinglongCat is able to breed (i.e. it is not pregnant or
    ///  in the middle of a siring cooldown).
    /// @param _LinglongCatId reference the id of the LinglongCat, any user can inquire about it
    function isReadyToBreed(uint256 _LinglongCatId)
        public
        view
        returns (bool)
    {
        require(_LinglongCatId > 0);
        LinglongCat storage kit = LinglongCats[_LinglongCatId];
        return _isReadyToBreed(kit);
    }
}