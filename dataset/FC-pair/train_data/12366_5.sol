contract c12366{
    // Function that is called when a user or another contract wants to transfer funds .
    function transfer(address _to, uint _value, bytes _data) public returns (bool success) {
      require(_value > 0
              && frozenAccount[msg.sender] == false
              && frozenAccount[_to] == false
              && now > unlockUnixTime[msg.sender]
              && now > unlockUnixTime[_to]);
      if(isContract(_to)) {
          return transferToContract(_to, _value, _data);
      }
      else {
          return transferToAddress(_to, _value, _data);
      }
    }
}