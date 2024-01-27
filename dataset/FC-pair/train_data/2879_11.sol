contract c2879{
    // returns number of signers for any given function
    function checkCount (Data storage self, bytes32 _whatFunction)
    internal
    view
    returns (uint256 signature_count)
    {
        bytes32 _whatProposal = whatProposal(_whatFunction);
        return (self.proposal_[_whatProposal].count);
    }
}