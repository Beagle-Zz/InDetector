contract c10121{
    /**
     *  @dev Set ENS registry contract address
     */
    function setENS(ENS _ens) public {
      require(address(ens) == 0);
      ens = _ens;
      resolver = PublicResolver(ens.resolver(lighthouseNode));
    }
}