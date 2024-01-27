contract c7582{
    /**
     * @notice The foundation may only confiscate a balance during the confirmation
     * period after a motion has passed.
     */
    function approveMotion(uint motionID)
        external
        onlyOwner
    {
        require(motionConfirming(motionID) && motionPasses(motionID));
        address target = motionTarget[motionID];
        nomin.freezeAndConfiscate(target);
        _closeMotion(motionID);
        emit MotionApproved(motionID);
    }
}