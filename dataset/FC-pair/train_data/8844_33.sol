contract c8844{
    /// @dev Checks that a given LinglongCat is able to breed. Requires that the
    ///  current cooldown is finished (for sires) and also checks that there is
    ///  no pending pregnancy.
    function _isReadyToBreed(LinglongCat _cat) internal view returns (bool) {
        // In addition to checking the cooldownEndBlock, we also need to check to see if
        // the cat has a pending birth; there can be some period of time between the end
        // of the pregnacy timer and the birth event.
        return (_cat.siringWithId == 0) && (_cat.cooldownEndBlock <= uint64(block.number));
    }
}