contract c14986{
   /**
    * @dev Modifier to make a function callable only when the address is in black list.
    */
   modifier onlyIfInBlackList(address _address) {
     require(blacklist[_address]);
     _;
   }
}