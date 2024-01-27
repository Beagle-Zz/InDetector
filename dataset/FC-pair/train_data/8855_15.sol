contract c8855{
     // @title changeAdminAddress allows to update the owner wallet
     // @param _newAddress is the address of the new admin wallet
     // @dev only callable by current owner
     function setOwnerAddress(address _newAddress)
     external
     onlyOwner
     nonZeroAddress(_newAddress)
     {
         hPayMultiSig = _newAddress;
         emit ChangeOwnerAddress(now, hPayMultiSig);
     }
}