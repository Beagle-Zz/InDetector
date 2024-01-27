contract c8311{
    /// @notice marks deliverable as fulfilled
    function completeDeliverable(ContentMapping storage self, bytes32 _id) internal returns(bool) {
        self.data[_id].deliverable.fulfilled = true;
        return true;
    }
}