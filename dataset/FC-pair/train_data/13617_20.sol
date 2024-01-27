contract c13617{
    /*@CTK CtkApproveNoEffect
      @post (paused == true) -> __post == this
     */
    /*@CTK CtkApprove
      @tag assume_completion
      @post __post.allowed[msg.sender][_spender] == _value
     */
    /* CertiK Smart Labelling, for more details visit: https://certik.org */
    function approve(address _spender, uint256 _value) public whenNotPaused
      returns (bool) {
      return super.approve(_spender, _value);
    }
}