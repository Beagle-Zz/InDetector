contract c16270{
      //Change active
      function change_active(uint256 _active) onlyOwner returns (bool result) {
        active = _active;
        return true;
      }
}