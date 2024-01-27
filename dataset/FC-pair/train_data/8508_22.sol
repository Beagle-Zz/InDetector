contract c8508{
    /**
   * @dev called by the operator to set the new operator to pause the token
   */
  function transferPauseOperator(address newPauseOperator) onlyPauseOperator public {
    require(newPauseOperator != address(0));
    emit PauseOperatorTransferred(pauseOperator, newPauseOperator);
    pauseOperator = newPauseOperator;
  }
}