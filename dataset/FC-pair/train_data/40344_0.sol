contract c40344{
     
     
     
     
     
     
     
     
    function externalEnter() internal {
        if (reentryProtector) {
            throw;
        }
        reentryProtector = true;
    }
}