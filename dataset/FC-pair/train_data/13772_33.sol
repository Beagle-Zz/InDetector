contract c13772{
    /// @dev Checks that a given EtherDog is able to breed. Requires that the
    ///  current cooldown is finished (for sires) and also checks that there is
    ///  no pending pregnancy.
    function _isReadyToBreed(EtherDog _dog) internal view returns (bool) {
        // In addition to checking the cooldownEndBlock, we also need to check to see if
        // the dog has a pending birth; there can be some period of time between the end
        // of the pregnacy timer and the birth event.
        return (_dog.siringWithId == 0) && (_dog.cooldownEndBlock <= uint64(block.number));
    }
}