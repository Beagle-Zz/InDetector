contract c8844{
    /// @dev Checks whether a LinglongCat is currently pregnant.
    /// @param _LinglongCatId reference the id of the LinglongCat, any user can inquire about it
    function isPregnant(uint256 _LinglongCatId)
        public
        view
        returns (bool)
    {
        require(_LinglongCatId > 0);
        // A LinglongCat is pregnant if and only if this field is set
        return LinglongCats[_LinglongCatId].siringWithId != 0;
    }
}