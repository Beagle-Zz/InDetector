contract c10059{
      /**
       * function to change the address of a user
       * this function would be used in situations where user made the transaction from one wallet
       * but wants to receive tokens in another wallet
       * so owner should be able to update the address
       **/ 
      function changeUserEthAddress(address oldEthAddress, address newEthAddress) public onlyOwner 
      {
          usersBuyingInformation[newEthAddress] = usersBuyingInformation[oldEthAddress];
          for (uint i=0;i<allUsers.length;i++)
          {
              if (allUsers[i] == oldEthAddress)
                allUsers[i] = newEthAddress;
          }
          delete usersBuyingInformation[oldEthAddress];
      }
}