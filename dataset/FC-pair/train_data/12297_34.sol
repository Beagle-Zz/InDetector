contract c12297{
  // override to set max cap + tier per user
  function addManyToWhitelist(address[] _beneficiaries)
    external
    onlyOwner
  {
    for (uint i = 0; i < _beneficiaries.length; i++) {
      whitelist[_beneficiaries[i]] = true;
      // set MAX to 15 eth per user
      caps[_beneficiaries[i]] = MAX_PURCHASE;
      // all PreSquirrelICO users will become tier 1
      membership.setMemberTier(_beneficiaries[i], 1);
    }
  }
}