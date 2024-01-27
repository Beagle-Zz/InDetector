contract c1420{
    /**
         * @notice Authorize a third party `_operator` to manage (send) `msg.sender`'s tokens at remote database.
         * @param _operator The operator that wants to be Authorized
         */
    function authorizeOperator(address _operator) public {
        require(_operator != msg.sender);
        require(balancesDB.setOperator(_operator, msg.sender, true));
        emit AuthorizedOperator(_operator, msg.sender);
    }
}