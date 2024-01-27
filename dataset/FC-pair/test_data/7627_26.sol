contract c7627{
    /**
        @notice Enable or disable approval for a third party ("operator") to manage
        @param _approved True if the operator is approved, false to revoke approval
        @param _operator Address to add to the set of authorized operators.
    */
    function setApprovalForAll(address _operator, bool _approved) public returns (bool) {
        operators[msg.sender][_operator] = _approved;
        ApprovalForAll(msg.sender, _operator, _approved);
        return true;
    }
}