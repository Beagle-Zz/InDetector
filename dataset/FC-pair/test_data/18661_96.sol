contract c18661{
  // @dev Set wether the turn data saved or not.
  function setIsTurnDataSaved(bool _value)
    onlyOwner
    public
  {
    isTurnDataSaved = _value;
  }
}