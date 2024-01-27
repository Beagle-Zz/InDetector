contract c7639{
    // Must be called after crowdsale ends, to do some extra finalization
    function finalize() onlyOwner public {
        require(!isFinalized);
        require(hasEnded());
        finalization();
        emit Finalized();
        isFinalized = true;
    }
}