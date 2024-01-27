contract c8311{
    /// @notice deliverable fulfilled
    modifier fulfilled(bytes32 _id) {
        require(content.isFulfilled(_id, creator, brand));
        _;
    }
}