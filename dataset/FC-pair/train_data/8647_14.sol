contract c8647{
    /*
    * Function for selling tokens in crowd time.
    *
    */
    function sell(address _investor, uint256 amount) internal
    {
        uint256 _amount = (amount.mul(DEC)).div(buyPrice);
        if (1 == stage) {
            _amount = _amount.add(withDiscount(_amount, ICO.discount));
        }
        else if (2 == stage)
        {
            if (now <= ICO.startDate + 1 days)
            {
                  if (0 == ICO.discountFirstDayICO) {
                      ICO.discountFirstDayICO = 20;
                  }
                  _amount = _amount.add(withDiscount(_amount, ICO.discountFirstDayICO));
            } else {
                _amount = _amount.add(withDiscount(_amount, ICO.discount));
            }
        } else if (3 == stage) {
            _amount = _amount.add(withDiscount(_amount, ICO.discount));
        }
        if (ICO.tokens < _amount)
        {
            emit CrowdSaleFinished(crowdSaleStatus());
            pauseInternal();
            revert();
        }
        ICO.tokens = ICO.tokens.sub(_amount);
        avaliableSupply = avaliableSupply.sub(_amount);
        _transfer(this, _investor, _amount);
    }
}