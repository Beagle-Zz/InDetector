contract c13581{
    /**
    * @dev   Token Contract Modifier
    * Check if only admin
    *
    */
    modifier onlyAdmin() {
      require(msg.sender == admin);
      _;
    }
}