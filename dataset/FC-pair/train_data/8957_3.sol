contract c8957{
    /// @notice Get account's freeze information
    /// @dev Get freeze information of '_target'
    /// @param _target Target address
    /// @return _freezeStartTime Freeze start time; _freezePeriod Freeze period(minutes); _freezeAmount Freeze token amount; _freezeDeadline Freeze deadline
    function getFreezeInfo(address _target) public view returns(
        uint _freezeStartTime, 
        uint _freezePeriod, 
        uint _freezeTotal, 
        uint _freezeDeadline) {
        FreezeAccountInfo storage targetFreezeInfo = freezeAccount[_target];
        uint freezeDeadline = targetFreezeInfo.freezeStartTime.add(targetFreezeInfo.freezePeriod.mul(1 minutes));
        return (
            targetFreezeInfo.freezeStartTime, 
            targetFreezeInfo.freezePeriod,
            targetFreezeInfo.freezeTotal,
            freezeDeadline
        );
    }
}