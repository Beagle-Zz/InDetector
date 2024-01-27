contract c16910{
  /************ Constant return functions ************/
  //@dev Returns the name of the token.
  function tokenName() constant public returns(string _tokenName){
    return name;
  }
}