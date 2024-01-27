contract c16921{
    /// @dev Checks that a given cutie is able to breed. Requires that the
    ///  current cooldown is finished (for dads)
    function _canBreed(Cutie _cutie) internal view returns (bool)
    {
        return _cutie.cooldownEndTime <= now;
    }
}