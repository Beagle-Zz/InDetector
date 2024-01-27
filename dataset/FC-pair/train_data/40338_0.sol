contract c40338{
   
  function requiredEndowment() constant returns (uint endowment) {
      uint sum = 0;
      for(uint i=0; i<untrustedProposals.length; i++) {
          uint proposalId = untrustedProposals[i];
          DAO child = whiteList[proposalId].dao;
          sum += (child.totalSupply() * (untrustedTokenNumerator[i] / ratioDenominator) );
      }
      return sum;
  }
}