contract c2091{
  /**
  * @dev Storing predictive event participation information
  *
  * The contract owner collects the event participation information
  * and stores the prediction event participation information
  * @param _id  unique identification of predicted events
  * @param _attendHash prediction event participation information hash value
  */
  function attend(uint32 _id,string _attendHash) public onlyOwner returns (bool) {
    require(moseEvents[_id].id == uint32(0),"The event exists");
    moseEvents[_id] = MoseEvent({id:_id, attendHash:_attendHash, result: "", finish:false});
    emit Attend(_id, _attendHash);
    return true;
  }
}