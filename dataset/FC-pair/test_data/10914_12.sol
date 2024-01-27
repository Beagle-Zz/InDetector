contract c10914{
    //functiion to force finalize the ICO by the owner no checks called here
    function finalizeICOOwner() onlyOwner{
        finalizedICO = true;
        istransferAllowed = true;
    }
}