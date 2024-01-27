contract c16509{
 /**
  * @dev Throws if called by any account other than the admin.
  */
 modifier onlyAdmin() {
   require(msg.sender == admin);
   _;
  }
}