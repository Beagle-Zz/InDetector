contract c18780{
    /// @notice Add funds to the bounty for a question
    /// @dev Add bounty funds after the initial question creation. Can be done any time until the question is finalized.
    /// @param question_id The ID of the question you wish to fund
    function fundAnswerBounty(bytes32 question_id) 
        stateOpen(question_id)
    external payable {
        questions[question_id].bounty = questions[question_id].bounty.add(msg.value);
        LogFundAnswerBounty(question_id, msg.value, questions[question_id].bounty, msg.sender);
    }
}