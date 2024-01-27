contract c7582{
    /* @notice The foundation may veto a motion at any time. */
    function vetoMotion(uint motionID)
        external
        onlyOwner
    {
        require(!motionWaiting(motionID));
        _closeMotion(motionID);
        emit MotionVetoed(motionID);
    }
}