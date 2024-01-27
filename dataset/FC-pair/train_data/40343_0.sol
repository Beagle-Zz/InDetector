contract c40343{
     
     
     
     
     
     
     
     
    function externalEnter() internal {
        if (reentryProtector) {
            throw;
        }
        reentryProtector = true;
    }
}