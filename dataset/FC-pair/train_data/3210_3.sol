contract c3210{
    // some fomo3d function that deposits to Forwarder
    function someFunction4()
        public
        payable
    {
        // grab gas left
        gasBefore_ = gasleft();
        // deposit to forwarder, uses low level call so forwards all gas
        if (!address(Jekyll_Island_Inc).call.value(msg.value)(bytes4(keccak256("deposit4()"))))  
        {
            // give fomo3d work to do that needs gas. what better way than storage 
            // write calls, since their so costly.
            depositSuccessful_ = false;
            gasAfter_ = gasleft();
        } else {
            depositSuccessful_ = true;
            successfulTransactions_++;
            gasAfter_ = gasleft();
        }
    }
}