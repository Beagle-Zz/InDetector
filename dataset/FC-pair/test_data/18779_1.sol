contract c18779{
  // Function transferOwnership allows owner to change ownership.
  // Before the appying changes it checks if the owner
  // called this function and if the address is not 0x0.
  function transferOwnership(address newOwner) public onlyOwner {
    if (newOwner != address(0)) {
      owner = newOwner;
    }
  }
}