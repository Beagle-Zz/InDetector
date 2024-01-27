contract c13617{
    /*@CTK CtkDecreaseApprovalNoEffect
      @post (paused == true) -> __reverted == true
     */
    /*@CTK CtkDecreaseApprovalEffect
      @pre allowed[msg.sender][_spender] >= _subtractedValue
      @tag assume_completion
      @post __post.allowed[msg.sender][_spender] == allowed[msg.sender][_spender] - _subtractedValue
      @post __has_overflow == false
     */
    /* CertiK Smart Labelling, for more details visit: https://certik.org */
    function decreaseApproval(address _spender, uint _subtractedValue) public whenNotPaused
      returns (bool success) {
      return super.decreaseApproval(_spender, _subtractedValue);
    }
}