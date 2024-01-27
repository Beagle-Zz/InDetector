contract c8311{
    /// @notice wrapper around internal deliverable method
    function isFulfilled(ContentMapping storage self, bytes32 _id, address _creator, address _brand) public view returns(bool) {
        return self.data[_id].deliverable.isFulfilled(_creator, _brand);
    }
}