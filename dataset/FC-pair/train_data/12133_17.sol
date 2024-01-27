contract c12133{
    // Use to claim EOS Classic from the calling address
    function claimEOSclassic() external returns (bool) 
    {
        return claimEOSclassicFor(msg.sender);
    }
}