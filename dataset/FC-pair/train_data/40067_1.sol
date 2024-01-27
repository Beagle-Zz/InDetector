contract c40067{
     
    modifier ifGeneralPartner {
        if (shareholders[msg.sender].limited == true)
            throw;
        _;
    }
}