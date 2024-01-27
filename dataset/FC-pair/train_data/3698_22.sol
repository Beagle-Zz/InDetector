contract c3698{
    // returns address of an admin who signed for any given function
    function checkSigner (Data storage self, bytes32 _whatFunction, uint256 _signer)
        internal
        view
        returns (address signer)
    {
        require(_signer > 0, "MSFun checkSigner failed - 0 not allowed");
        bytes32 _whatProposal = whatProposal(_whatFunction);
        return (self.proposal_[_whatProposal].log[_signer - 1]);
    }
}