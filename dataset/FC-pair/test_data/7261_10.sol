contract c7261{
    //-------------------------------------------------------------------------- @dev Allow access only when is unlocked. This function is good when you make crowdsale to avoid token expose in exchanges
    modifier unlocked() 
    {
        require((now > lockedUntil) || (allowedSender == msg.sender));
        _;
    }
}