contract c2362{
  //Automatocally forwards ether from smart contract to owner address
    function forwardEherToOwner() internal {
        if (!owner.send(msg.value)) {
          revert();
        }
      }
}