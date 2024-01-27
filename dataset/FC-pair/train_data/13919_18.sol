contract c13919{
  /**
   * @dev Approve remove owner request, can be call only by owner
   * which don't call this remove owner request before.
   */
  function approveRemoveOwnerRequest2 () public onlyOwners {
    require (ownersCount - 1 >= needApprovesToConfirm && ownersCount > 2);
    require (owners[removeOwners2.newOwner]);
    require (!removeOwners2.isExecute && !removeOwners2.isCanceled);
    require (removeOwners2.creationTimestamp + lifeTime >= uint32(now));
    for (uint i = 0; i < removeOwners2.confirmators.length; i++){
      require(removeOwners2.confirmators[i] != msg.sender);
    }
    removeOwners2.confirms++;
    removeOwners2.confirmators.push(msg.sender);
    if(removeOwners2.confirms >= needApprovesToConfirm){
      removeOwners2.isExecute = true;
      owners[removeOwners2.newOwner] = false;
      ownersCount--;
      _removeOwnersAproves(removeOwners2.newOwner);
    }
    emit RemoveOwnerRequestUpdate2(msg.sender, removeOwners2.confirms, removeOwners2.isExecute);
  }
}