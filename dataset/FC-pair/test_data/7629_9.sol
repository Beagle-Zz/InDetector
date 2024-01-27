contract c7629{
// Validators:
// returns one proposal (the first one) greater than, STRICTLY GREATER THAN the given _timestampFrom 
// timestamp > _timestampFrom 
function getProposals(uint _timestampFrom) constant public returns (bytes32 _rootHash)
{
   // returns the first rootHash corresponding to a timestamp greater than the parameter 
   uint max = rootHashesProposals.length ; 
   for(uint i = 0 ; i < max ; i++ ) 
    {
      if (proposals[rootHashesProposals[i]].timestamp > _timestampFrom)
         return rootHashesProposals[i] ; 
    }
}
}