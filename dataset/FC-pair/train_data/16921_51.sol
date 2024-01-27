contract c16921{
    /// @dev Set the cooldownEndTime for the given Cutie, based on its current cooldownIndex.
    ///  Also increments the cooldownIndex (unless it has hit the cap).
    /// @param _cutie A reference to the Cutie in storage which needs its timer started.
    function _triggerCooldown(uint40 _cutieId, Cutie storage _cutie) internal
    {
        // Compute the end of the cooldown time, based on current cooldownIndex
        uint40 oldValue = _cutie.cooldownIndex;
        _cutie.cooldownEndTime = config.getCooldownEndTimeFromIndex(_cutie.cooldownIndex);
        emit CooldownEndTimeChanged(_cutieId, oldValue, _cutie.cooldownEndTime);
        // Increment the breeding count.
        if (_cutie.cooldownIndex + 1 < config.getCooldownIndexCount()) {
            uint16 oldValue2 = _cutie.cooldownIndex;
            _cutie.cooldownIndex++;
            emit CooldownIndexChanged(_cutieId, oldValue2, _cutie.cooldownIndex);
        }
    }
}