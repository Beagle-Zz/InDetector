contract c12537{
  // deleting actual file on the IPFS network is very hard.
  function deleteDocument(uint index)
    public 
  {
    require(state != State.Finished);
    require(state != State.Locked);
    if(index<item.documents.length){
      item.documents[index].state = FileState.Invalidated;
    }
  }
}