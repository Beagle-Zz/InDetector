contract c18780{
    /// @notice Submit an answer for a question.
    /// @dev Adds the answer to the history and updates the current "best" answer.
    /// May be subject to front-running attacks; Substitute submitAnswerCommitment()->submitAnswerReveal() to prevent them.
    /// @param question_id The ID of the question
    /// @param answer The answer, encoded into bytes32
    /// @param max_previous If specified, reverts if a bond higher than this was submitted after you sent your transaction.
    function submitAnswer(bytes32 question_id, bytes32 answer, uint256 max_previous) 
        stateOpen(question_id)
        bondMustDouble(question_id)
        previousBondMustNotBeatMaxPrevious(question_id, max_previous)
    external payable {
        _addAnswerToHistory(question_id, answer, msg.sender, msg.value, false);
        _updateCurrentAnswer(question_id, answer, questions[question_id].timeout);
    }
}