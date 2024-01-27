contract c40123{
     
    function activate (
        bool    _sellsTokens,
        bool    _buysTokens
        )
    {
          sellsTokens   = _sellsTokens;
          buysTokens    = _buysTokens;
          ActivatedEvent(sellsTokens,buysTokens);
    }
}