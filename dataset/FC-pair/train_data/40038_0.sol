contract c40038{
     
     
    modifier isTokenSwapOn {
        if (tokenSwapLock) throw;
        _;
    }
}