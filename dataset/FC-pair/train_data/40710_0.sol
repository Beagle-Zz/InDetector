contract c40710{
   
  function paybackAll() onlyowner returns (bool) {
    while(players.length > 0) {if(!paybackLast()) return false;}
    return true;
  }
}