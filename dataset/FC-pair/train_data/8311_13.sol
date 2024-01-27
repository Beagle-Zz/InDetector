contract c8311{
    /// @notice return reward of content delivarable
    function rewardOf(ContentMapping storage self, bytes32 _id) public view returns (uint256) {
        return self.data[_id].deliverable.reward;
    }
}