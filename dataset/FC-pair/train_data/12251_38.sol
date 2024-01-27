contract c12251{
    /// @dev Checks to see if a given Zodiac is pregnant and (if so) if the gestation
    ///  period has passed.
    function _isReadyToGiveBirth(Zodiac _matron) private view returns (bool) {
        return (_matron.siringWithId != 0) && (_matron.cooldownEndBlock <= uint64(block.number));
    }
}