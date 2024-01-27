contract c14984{
   /**
    * @dev Modifier to make a function callable only when the address is not in black list.
    */
   modifier notInBlackList() {
     require(!blacklist[msg.sender]);
     _;
   }
}