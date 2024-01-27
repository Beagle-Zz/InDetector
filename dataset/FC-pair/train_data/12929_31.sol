contract c12929{
    /// @notice Checks that a given kitten is able to breed (i.e. it is not pregnant or
    ///  in the middle of a siring cooldown).
    /// @param _dogId reference the id of the kitten, any user can inquire about it
    function isReadyToBreed(uint256 _dogId)
        public
        view
        returns (bool)
    {
        //zhangyong
        //创世狗有两只
        require(_dogId > 1);
        Dog storage dog = dogs[_dogId];
        return _isReadyToBreed(dog);
    }
}