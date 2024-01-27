contract c12927{
    /// @dev Checks whether a Dog is currently pregnant.
    /// @param _dogId reference the id of the kitten, any user can inquire about it
    function isPregnant(uint256 _dogId)
        public
        view
        returns (bool)
    {
        // A Dog is pregnant if and only if this field is set
        return dogs[_dogId].siringWithId != 0;
    }
}