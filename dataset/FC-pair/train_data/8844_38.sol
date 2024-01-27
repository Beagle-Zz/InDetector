contract c8844{
    /// @dev Checks to see if a given LinglongCat is pregnant and (if so) if the gestation
    ///  period has passed.
    function _isReadyToGiveBirth(LinglongCat _matron) private view returns (bool) {
        return (_matron.siringWithId != 0) && (_matron.cooldownEndBlock <= uint64(block.number));
    }
}