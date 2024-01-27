contract c7020{
  //Register members whose identity information has been verified on the website by batch system, for KYC/AML
  function provenAddress(address _addr, bool _isConfirm) public onlyAuthorized {
    IdentificationDb[_addr] = _isConfirm;
    emit proven(_addr,_isConfirm);
  }
}