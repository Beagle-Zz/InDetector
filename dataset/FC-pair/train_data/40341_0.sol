contract c40341{
     
     
     
     
     
     
     
     
    function externalEnter() internal {
        if (reentryProtector) {
            throw;
        }
        reentryProtector = true;
    }
}