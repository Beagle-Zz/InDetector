contract c18780{
    /// @notice Notify the contract that the arbitrator has been paid for a question, freezing it pending their decision.
    /// @dev The arbitrator contract is trusted to only call this if they've been paid, and tell us who paid them.
    /// @param question_id The ID of the question
    /// @param requester The account that requested arbitration
    function notifyOfArbitrationRequest(bytes32 question_id, address requester) 
        onlyArbitrator(question_id)
        stateOpen(question_id)
    external {
        questions[question_id].is_pending_arbitration = true;
        LogNotifyOfArbitrationRequest(question_id, requester);
    }
}