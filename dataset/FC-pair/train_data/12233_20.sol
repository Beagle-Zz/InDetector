contract c12233{
  // Finish crowdsale
  function finish()
    public
    hasntStopped()
    hasBeenStarted()
    whenCrowdsaleAlive()
    onlyOwner()
  {
    completed = true;
    emit CUSTOM_CROWDSALE_FINISH();
  }
}