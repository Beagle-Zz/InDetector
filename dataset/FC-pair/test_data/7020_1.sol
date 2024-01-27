contract c7020{
  //Identification check for KYC/AML
  function verify(address _addr) public view returns(bool) {
   return IdentificationDb[_addr];
  }
}