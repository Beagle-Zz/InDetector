contract c40345{
   
  function requiredEndowment() constant returns (uint endowment) {
      uint sum = 0;
      for(uint i=0; i<trustedProposals.length; i++) {
          uint proposalId = trustedProposals[i];
          DAO childDAO = whiteList[proposalId];
          sum += childDAO.totalSupply();
      }
      return sum;
  }
}