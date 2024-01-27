contract c10993{
    /**
     * @dev called by the owner to set new pause flags
     * pausedPublic can't be false while pausedOwnerAdmin is true
     */
    function setPause(bool _isPause) onlyAdmins public {
        require(paused != _isPause);
        paused = _isPause;
        emit SetPause(_isPause);
    }
}