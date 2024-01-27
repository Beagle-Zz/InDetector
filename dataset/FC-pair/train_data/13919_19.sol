contract c13919{
  /**
   * @dev Cancel remove owner request, can be call only by owner
   * which created this remove owner request.
   */
  function cancelRemoveOwnerRequest2 () public {
    require (msg.sender == removeOwners2.initiator);    
    require (!removeOwners2.isCanceled && !removeOwners2.isExecute);
    removeOwners2.isCanceled = true;
    emit RemoveOwnerRequestCanceled2();
  }
}