contract c8311{
    /// @notice approve reward amount for transfer from escrow contract to creator
    function _approveEscrow(bytes32 _id, uint256 _amount) internal returns(bool) {
        claimable = claimable.add(_amount);
        claimableRewards[_id] = _amount;
        return true;
    }
}