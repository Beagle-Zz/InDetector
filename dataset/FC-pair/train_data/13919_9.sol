contract c13919{
  /**
   * @dev Approve new owners count request, can be call only by owner
   * which don't call this new owners count request before.
   */
  function approveNewOwnersCount () public onlyOwners {
    require (setNewApproves.count <= ownersCount);
    require (setNewApproves.creationTimestamp + lifeTime >= uint32(now));
    for (uint i = 0; i < setNewApproves.confirmators.length; i++){
      require(setNewApproves.confirmators[i] != msg.sender);
    }
    require (!setNewApproves.isExecute && !setNewApproves.isCanceled);
    setNewApproves.confirms++;
    setNewApproves.confirmators.push(msg.sender);
    if(setNewApproves.confirms >= needApprovesToConfirm){
      setNewApproves.isExecute = true;
      needApprovesToConfirm = setNewApproves.count;   
    }
    emit NewNeedApprovesToConfirmRequestUpdate(msg.sender, setNewApproves.confirms, setNewApproves.isExecute);
  }
}