contract c12661{
    /**
    * @notice Revoke a third party `_operator`'s rights to manage (send) `msg.sender`'s tokens.
    * @param _operator The operator that wants to be Revoked
    */
    function revokeOperator(address _operator) public {
        require(_operator != msg.sender);
        isOperatorFor[_operator][msg.sender] = false;
        emit RevokedOperator(_operator, msg.sender);
    }
}