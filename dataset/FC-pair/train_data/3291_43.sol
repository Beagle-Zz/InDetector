contract c3291{
  //start the public sale manually after the presale is over, duration is in days
  function startPublicSale(uint _startTime, uint _duration) public onlyWhitelisted inStage(Stage.PresaleFinished) {
    require(_startTime >= now);
    require(_duration > 0);
    startTime = _startTime;
    endTime = _startTime + _duration * 1 days;
    publicSaleInitialized = true;
  }
}