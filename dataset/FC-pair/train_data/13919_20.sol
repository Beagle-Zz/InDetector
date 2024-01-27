contract c13919{
  //Finish remove 2nd owner
  /**
   * @dev internal function to check and revert all actions
   * by removed owner in this contract.
   * If _oldOwner created request then it will be canceled.
   * If _oldOwner approved request then his approve will canceled.
   */
  function _removeOwnersAproves(address _oldOwner) internal{
    //@dev check actions in setNewMint requests
    //@dev check for empty struct
    if (setNewMint.initiator != address(0)){
      //@dev check, can this request be approved by someone, if no then no sense to change something
      if (setNewMint.creationTimestamp + lifeTime >= uint32(now) && !setNewMint.isExecute && !setNewMint.isCanceled){
        if(setNewMint.initiator == _oldOwner){
          setNewMint.isCanceled = true;
          emit NewMintRequestCanceled();
        }else{
          //@dev Trying to find _oldOwner in struct confirmators
          for (uint i = 0; i < setNewMint.confirmators.length; i++){
            if (setNewMint.confirmators[i] == _oldOwner){
              //@dev if _oldOwner confirmed this request he should be removed from confirmators
              setNewMint.confirmators[i] = address(0);
              setNewMint.confirms--;
              /**
               *@dev Struct can be confirmed each owner just once
               *so no sence to continue loop
               */
              break;
            }
          }
        }
      }
    }
    /**@dev check actions in finishMintingStruct requests
     * check for empty struct
     */
    if (finishMintingStruct.initiator != address(0)){
      //@dev check, can this request be approved by someone, if no then no sense to change something
      if (finishMintingStruct.creationTimestamp + lifeTime >= uint32(now) && !finishMintingStruct.isExecute && !finishMintingStruct.isCanceled){
        if(finishMintingStruct.initiator == _oldOwner){
          finishMintingStruct.isCanceled = true;
          emit NewMintRequestCanceled();
        }else{
          //@dev Trying to find _oldOwner in struct confirmators
          for (i = 0; i < finishMintingStruct.confirmators.length; i++){
            if (finishMintingStruct.confirmators[i] == _oldOwner){
              //@dev if _oldOwner confirmed this request he should be removed from confirmators
              finishMintingStruct.confirmators[i] = address(0);
              finishMintingStruct.confirms--;
              /**
               *@dev Struct can be confirmed each owner just once
               *so no sence to continue loop
               */
              break;
            }
          }
        }     
      }
    }
    /**@dev check actions in setNewApproves requests
     * check for empty struct
     */
    if (setNewApproves.initiator != address(0)){
      //@dev check, can this request be approved by someone, if no then no sense to change something
      if (setNewApproves.creationTimestamp + lifeTime >= uint32(now) && !setNewApproves.isExecute && !setNewApproves.isCanceled){
        if(setNewApproves.initiator == _oldOwner){
          setNewApproves.isCanceled = true;
          emit NewNeedApprovesToConfirmRequestCanceled();
        }else{
          //@dev Trying to find _oldOwner in struct confirmators
          for (i = 0; i < setNewApproves.confirmators.length; i++){
            if (setNewApproves.confirmators[i] == _oldOwner){
              //@dev if _oldOwner confirmed this request he should be removed from confirmators
              setNewApproves.confirmators[i] = address(0);
              setNewApproves.confirms--;
              /**
               *@dev Struct can be confirmed each owner just once
               *so no sence to continue loop
               */
              break;
            }
          }
        }
      }
    }
    /**
     *@dev check actions in addOwner requests
     *check for empty struct
     */
    if (addOwner.initiator != address(0)){
      //@dev check, can this request be approved by someone, if no then no sense to change something
      if (addOwner.creationTimestamp + lifeTime >= uint32(now) && !addOwner.isExecute && !addOwner.isCanceled){
        if(addOwner.initiator == _oldOwner){
          addOwner.isCanceled = true;
          emit AddOwnerRequestCanceled();
        }else{
          //@dev Trying to find _oldOwner in struct confirmators
          for (i = 0; i < addOwner.confirmators.length; i++){
            if (addOwner.confirmators[i] == _oldOwner){
              //@dev if _oldOwner confirmed this request he should be removed from confirmators
              addOwner.confirmators[i] = address(0);
              addOwner.confirms--;
              /**
               *@dev Struct can be confirmed each owner just once
               *so no sence to continue loop
               */
              break;
            }
          }
        }
      }
    }
    /**@dev check actions in removeOwners requests
     *@dev check for empty struct
    */
    if (removeOwners.initiator != address(0)){
      //@dev check, can this request be approved by someone, if no then no sense to change something
      if (removeOwners.creationTimestamp + lifeTime >= uint32(now) && !removeOwners.isExecute && !removeOwners.isCanceled){
        if(removeOwners.initiator == _oldOwner){
          removeOwners.isCanceled = true;
          emit RemoveOwnerRequestCanceled();
        }else{
          //@dev Trying to find _oldOwner in struct confirmators
          for (i = 0; i < removeOwners.confirmators.length; i++){
            if (removeOwners.confirmators[i] == _oldOwner){
              //@dev if _oldOwner confirmed this request he should be removed from confirmators
              removeOwners.confirmators[i] = address(0);
              removeOwners.confirms--;
              /**
               *@dev Struct can be confirmed each owner just once
               *so no sence to continue loop
               */
              break;
            }
          }
        }
      }
    }
  }
}