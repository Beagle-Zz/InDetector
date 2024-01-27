contract c8311{
    /// @notice return new deliverable struct if reward greater than 0
    function newDeliverable(uint256 _reward) internal pure returns(Deliverable _deliverable) {
        require(_reward > 0);
        return Deliverable(_reward, false);
    }
}