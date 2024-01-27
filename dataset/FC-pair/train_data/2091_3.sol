contract c2091{
  /**
   * @dev Publish forecast event results
   * @param _id unique identification of predicted events
   * @param _result prediction result information
   */
  function publishResult(uint32 _id,string _result) public onlyOwner returns (bool) {
    require(moseEvents[_id].id != uint32(0),"The event not exists");
    require(!moseEvents[_id].finish,"The event has been completed");
    moseEvents[_id].result = _result;
    moseEvents[_id].finish = true;
    emit PublishResult(_id, _result, true);
    return true;
  }
}