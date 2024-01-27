contract c7803{
    //only the owner is allowed to burn tokens
    function burn(uint256 _value) public onlyOwner {
      _burn(msg.sender, _value);
    }
}