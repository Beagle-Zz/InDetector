contract c2091{
  /**
   * Query the event to participate in the HASH by guessing the event ID
   */
  function showMoseEvent(uint32 _id) public view returns (uint32,string,string,bool) {
    return (moseEvents[_id].id, moseEvents[_id].attendHash,moseEvents[_id].result,moseEvents[_id].finish);
  }
}