contract c1420{
    /**
     * @notice Revoke a third party `_operator`'s rights to manage (send) `msg.sender`'s tokens at remote database.
     * @param _operator The operator that wants to be Revoked
     */
    function revokeOperator(address _operator) public {
        require(_operator != msg.sender);
        require(balancesDB.setOperator(_operator, msg.sender, false));
        emit RevokedOperator(_operator, msg.sender);
    }
}