contract c13202{
    // Upload documentation for proof of marrage like a marriage certificate
    function marriageProof(bytes IPFSProofHash) onlyOwner public {
        marriageProofDoc = IPFSProofHash;
        majorEventFunc(block.timestamp, "Entered Marriage Proof", "Marriage proof in IPFS");
    }
}