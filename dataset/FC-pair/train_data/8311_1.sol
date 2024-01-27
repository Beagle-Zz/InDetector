contract c8311{
    /// @notice complete deliverable by making reward amount claimable
    function completeDeliverable(bytes32 _id, address _creator, address _brand) internal returns(bool) {
        require(content.isFulfilled(_id, _creator, _brand));
        content.completeDeliverable(_id);
        return _approveEscrow(_id, content.rewardOf(_id));       
    }
}