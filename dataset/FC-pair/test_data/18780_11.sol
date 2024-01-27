contract c18780{
    /// @notice Return the final answer to the specified question, or revert if there isn't one
    /// @param question_id The ID of the question
    /// @return The answer formatted as a bytes32
    function getFinalAnswer(bytes32 question_id) 
        stateFinalized(question_id)
    external constant returns (bytes32) {
        return questions[question_id].best_answer;
    }
}