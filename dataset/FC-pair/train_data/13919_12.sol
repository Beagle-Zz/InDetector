contract c13919{
  /**
   * @dev Approve new owner request, can be call only by owner
   * which don't call this new owner request before.
   */
  function approveAddOwnerRequest () public onlyOwners {
    require (!addOwner.isExecute && !addOwner.isCanceled);
    require (addOwner.creationTimestamp + lifeTime >= uint32(now));
    /**
     *@dev new owner shoudn't be in owners mapping
     */
    require (!owners[addOwner.newOwner]);
    for (uint i = 0; i < addOwner.confirmators.length; i++){
      require(addOwner.confirmators[i] != msg.sender);
    }
    addOwner.confirms++;
    addOwner.confirmators.push(msg.sender);
    if(addOwner.confirms >= needApprovesToConfirm){
      addOwner.isExecute = true;
      owners[addOwner.newOwner] = true;
      ownersCount++;
    }
    emit AddOwnerRequestUpdate(msg.sender, addOwner.confirms, addOwner.isExecute);
  }
}