contract c40039{
     
     
    modifier isTokenSwapOn {
        if (tokenSwapLock) throw;
        _;
    }
}