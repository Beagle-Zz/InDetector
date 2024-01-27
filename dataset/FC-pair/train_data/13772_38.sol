contract c13772{
    /// @dev Checks to see if a given EtherDog is pregnant and (if so) if the gestation
    ///  period has passed.
    function _isReadyToGiveBirth(EtherDog _matron) private view returns (bool) {
        return (_matron.siringWithId != 0) && (_matron.cooldownEndBlock <= uint64(block.number));
    }
}