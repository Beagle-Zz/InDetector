contract c11945{
    /// @notice Revokes a prior confirmation of the given operation
    /// @param _operation operation value, typically keccak256(msg.data)
    function revoke(bytes32 _operation)
        external
        multiOwnedOperationIsActive(_operation)
        onlyowner
    {
        uint ownerIndexBit = makeOwnerBitmapBit(msg.sender);
        var pending = m_multiOwnedPending[_operation];
        require(pending.ownersDone & ownerIndexBit > 0);
        assertOperationIsConsistent(_operation);
        pending.yetNeeded++;
        pending.ownersDone -= ownerIndexBit;
        assertOperationIsConsistent(_operation);
        Revoke(msg.sender, _operation);
    }
}